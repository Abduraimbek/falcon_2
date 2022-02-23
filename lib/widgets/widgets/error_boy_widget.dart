///
/// Created by Abduraimbek Yarkinov at 13:13 on 02.12.2021.
///

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorBoyWidget extends StatelessWidget {
  const ErrorBoyWidget({
    Key? key,
    required this.boxFit,
  }) : super(key: key);

  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Lottie.asset(
        "assets/my_lotties/error_boy.json",
        fit: boxFit,
      ),
    );
  }
}
