///
/// Created by Abduraimbek Yarkinov at 15:43 on 06.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/svg.dart';

class BuildCustomer extends StatelessWidget {
  const BuildCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Customer             ",
          style: MyTextStyles.interMediumFirst(
            color: MyColors.backgroundColor,
          ),
        ),
        Text(
          "Falcon Group LLC",
          style: MyTextStyles.interMediumFirst(color: MyColors.redColor),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/svg3/message_2.svg",
            fit: BoxFit.cover,
            color: MyColors.redColor,
            width: 2.3.vertical,
            height: 2.3.vertical,
          ),
        ),
      ],
    );
  }
}
