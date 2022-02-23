///
/// Created by Abduraimbek Yarkinov at 11:23 on 27.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Details of Active Shipment Ref. #486876",
            style: MyTextStyles.interMediumFirst(fontSize: 3.8),
          ),
          const Spacer(),
          Text(
            "Contract:           ",
            style: MyTextStyles.interMediumFirst(color: MyColors.redColor),
          ),
          Text(
            "Ref. #486876.pdf",
            style: MyTextStyles.interMediumFirst(color: MyColors.redColor)
                .copyWith(decoration: TextDecoration.underline),
          ),
          const SizedBox(width: 15),
          SvgPicture.asset(
            "assets/svg3/receive_square.svg",
            fit: BoxFit.cover,
            width: 1.69.vertical,
            height: 1.69.vertical,
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
