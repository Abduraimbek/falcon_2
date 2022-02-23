///
/// Created by Abduraimbek Yarkinov at 17:50 on 18.11.2021.
///

import 'package:flutter/material.dart';
import 'build_list/build_list.dart';
import 'package:falcon_2/utils/utils.dart';
import 'build_filter/build_filter.dart';
import 'build_headers/build_headers.dart';

class PostedLoads3 extends StatelessWidget {
  const PostedLoads3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BuildFilter(),
        const BuildHeaders(),
        const SizedBox(height: 20),
        Container(
          height: 1,
          width: double.infinity,
          color: MyColors.secondTextColor,
        ),
        const Expanded(child: BuildList()),
      ],
    );
  }
}
