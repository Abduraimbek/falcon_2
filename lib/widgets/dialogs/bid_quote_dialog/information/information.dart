///
/// Created by Abduraimbek Yarkinov at 11:25 on 22.11.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter/material.dart';
import 'top.dart';
import 'package:falcon_2/utils/utils.dart';
import 'bottom.dart';

class Information extends StatelessWidget {
  const Information({
    Key? key,
    required this.model,
  }) : super(key: key);

  final QuoteByIdOrderModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Top(model: model),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 1,
          color: MyColors.secondTextColor,
        ),
        const SizedBox(height: 10),
        Expanded(child: Bottom(model: model)),
      ],
    );
  }
}
