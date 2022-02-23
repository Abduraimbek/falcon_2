///
/// Created by Abduraimbek Yarkinov at 16:50 on 29.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'top/top.dart';

class CreateLoad extends StatelessWidget {
  const CreateLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Top(),
        Container(
          width: double.infinity,
          height: 1,
          color: MyColors.thirdTextColor,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
