///
/// Created by Abduraimbek Yarkinov at 11:19 on 16.11.2021.
///

import 'package:flutter/material.dart';

class MyCustomRoutes {
  static Route myMaterialPageRoute(dynamic t) =>
      MaterialPageRoute(builder: (_) => t);

  static Route myAnimatedRoute(dynamic t) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => t,
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset.zero;
        const curve = Curves.linear;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
