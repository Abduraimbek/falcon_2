///
/// Created by Abduraimbek Yarkinov at 14:19 on 29.11.2021.
///

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class BuildImage extends StatelessWidget {
  const BuildImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "https://img.ccjdigital.com/files/base/randallreilly/all/"
          "image/2021/07/trucker.60ef5579d090e.png?auto="
          "format%2Ccompress&fit=max&q=70&w=1200",
      fit: BoxFit.cover,
      width: 11.13.vertical,
      height: double.infinity,
      placeholder: (_, __) => Container(
        width: 11.13.vertical,
        height: double.infinity,
        color: MyColors.thirdTextColor,
      ),
      errorWidget: (_, __, ___) => Container(
        width: 11.13.vertical,
        height: double.infinity,
        color: MyColors.thirdTextColor,
      ),
    );
  }
}
