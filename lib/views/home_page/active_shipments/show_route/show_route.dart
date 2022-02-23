///
/// Created by Abduraimbek Yarkinov at 17:50 on 06.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:flutter_svg/svg.dart';

class ShowRoute extends StatelessWidget {
  const ShowRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: MyButtonView(
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svg3/map.svg",
                color: MyColors.redColor,
                fit: BoxFit.cover,
                width: 2.vertical,
                height: 2.vertical,
              ),
              const SizedBox(width: 5),
              Text(
                "Show Route",
                style: MyTextStyles.interMediumFirst(
                  color: MyColors.redColor,
                  fontSize: 3.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
