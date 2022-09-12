import 'package:flutter/material.dart';
import 'app.dart';
import 'package:falcon_2/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: App()));
}
