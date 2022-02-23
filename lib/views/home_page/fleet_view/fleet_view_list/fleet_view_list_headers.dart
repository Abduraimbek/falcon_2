///
/// Created by Abduraimbek Yarkinov at 16:40 on 27.11.2021.
///

import 'package:falcon_2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/svg.dart';

class FleetViewListHeaders extends StatelessWidget {
  const FleetViewListHeaders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = MyTextStyles.interMediumTens(fontSize: 3.7);

    return Padding(
      padding: const EdgeInsets.all(25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text("ID", style: style),
          ),
          Expanded(
            flex: 3,
            child: Text("Driver", style: style),
          ),
          Expanded(
            flex: 3,
            child: Text("Truck type", style: style),
          ),
          Expanded(
            flex: 3,
            child: Text("Status", style: style),
          ),
          Expanded(
            flex: 8,
            child: Text("Location", style: style),
          ),
          Expanded(
            flex: 5,
            child: Text("Employee", style: style),
          ),
          Expanded(
            flex: 3,
            child: Text("Notes", style: style),
          ),
          const Opacity(
            opacity: 0,
            child: Switch(
              value: false,
              onChanged: null,
            ),
          ),
          Opacity(
            opacity: 0,
            child: MyButtonView(
              onTap: () {},
              child: SvgPicture.asset(
                "assets/svg2/pencil.svg",
                fit: BoxFit.cover,
                color: MyColors.backgroundColor,
              ),
            ),
          ),
          Opacity(
            opacity: 0,
            child: MyButtonView(
              onTap: () {},
              child: const Icon(
                Icons.info_outline,
                color: MyColors.backgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
