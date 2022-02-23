///
/// Created by Abduraimbek Yarkinov at 13:12 on 02.12.2021.
///

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPaperplaneWidget extends StatelessWidget {
  const LoadingPaperplaneWidget({
    Key? key,
    required this.boxFit,
  }) : super(key: key);

  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      "assets/my_lotties/loading_paperplane.json",
      fit: boxFit,
    );
  }
}
