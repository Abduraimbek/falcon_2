import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'package:falcon_2/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: App()));
  doWhenWindowReady(() => appWindow
    ..maximize()
    ..minSize = const Size(1280, 720)
    ..title = "Falcon Group LLC"
    ..show());
}
