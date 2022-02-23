import 'package:flutter/material.dart';
import 'package:falcon_2/views/views.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/providers/providers.dart';

class Wrapper extends ConsumerStatefulWidget {
  const Wrapper({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _WrapperState();
}

class _WrapperState extends ConsumerState<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SizeConfig().initWidthAndHeight(size.width, size.height);

    return FutureBuilder(
      future: _waitBeforeRunningApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (MyPrefsFields.isAuthenticated) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        } else {
          return const LoadingPage();
        }
      },
    );
  }

  Future<void> _waitBeforeRunningApp() async {
    await Future.wait([
      MyObjectbox.init(),
      MyPrefs().initialize(),
    ]);

    ref.read(chattingProvider).startListeningFalcon();
    ref.read(chattingProvider).startListeningAzam();
  }
}
