///
/// Created by Abduraimbek Yarkinov at 16:58 on 11.12.2021.
///

import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';

class MyWebview extends StatefulWidget {
  const MyWebview({
    Key? key,
    required this.from,
    required this.to,
    required this.stop,
  }) : super(key: key);

  final String from;
  final String to;
  final String? stop;

  @override
  _MyWebviewState createState() => _MyWebviewState();
}

class _MyWebviewState extends State<MyWebview> {
  late WebviewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebviewController();

    initPlatformState();
  }

  String _getUrl() {
    String url = "http://89.223.71.112:8088/?";
    url += "from=${widget.from}";
    url += "&to=${widget.to}";
    if (widget.stop != null) {
      url += "&stop=${widget.stop}";
    }
    url += "&error=Error occurred while location getting!!!";
    print(url);
    return url;
  }

  @override
  void didUpdateWidget(MyWebview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.from != oldWidget.from) {
      _controller.loadUrl(_getUrl());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> initPlatformState() async {
    // Optionally initialize the webview environment using
    // a custom user data directory
    // and/or a custom browser executable directory
    // and/or custom chromium command line flags
    //await WebviewController.initializeEnvironment(
    //    additionalArguments: '--show-fps-counter');

    await _controller.initialize();

    await _controller.setBackgroundColor(Colors.transparent);
    await _controller.setPopupWindowPolicy(WebviewPopupWindowPolicy.deny);
    await _controller.loadUrl(_getUrl());

    if (!mounted) return;

    setState(() {});
  }

  Widget compositeView() {
    if (!_controller.value.isInitialized) {
      return const Text(
        'Not Initialized',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              Webview(
                _controller,
                permissionRequested: _onPermissionRequested,
              ),
              StreamBuilder<LoadingState>(
                  stream: _controller.loadingState,
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.data == LoadingState.loading) {
                      return const LinearProgressIndicator();
                    } else {
                      return const SizedBox();
                    }
                  }),
            ],
          )),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return compositeView();
  }

  Future<WebviewPermissionDecision> _onPermissionRequested(
      String url, WebviewPermissionKind kind, bool isUserInitiated) async {
    // final decision = await showDialog<WebviewPermissionDecision>(
    //   context: navigatorKey.currentContext!,
    //   builder: (BuildContext context) => AlertDialog(
    //     title: const Text('WebView permission requested'),
    //     content: Text('WebView has requested permission \'$kind\''),
    //     actions: <Widget>[
    //       TextButton(
    //         onPressed: () =>
    //             Navigator.pop(context, WebviewPermissionDecision.deny),
    //         child: const Text('Deny'),
    //       ),
    //       TextButton(
    //         onPressed: () =>
    //             Navigator.pop(context, WebviewPermissionDecision.allow),
    //         child: const Text('Allow'),
    //       ),
    //     ],
    //   ),
    // );

    return WebviewPermissionDecision.allow;
  }
}
