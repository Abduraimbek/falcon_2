///
/// Created by Abduraimbek Yarkinov at 11:07 on 16.11.2021.
///

import 'package:flutter/material.dart';
import 'wrapper.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
    );
  }
}
