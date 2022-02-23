///
/// Created by Abduraimbek Yarkinov at 11:20 on 19.11.2021.
///

import 'package:flutter/material.dart';
import 'headers_item.dart';

class BuildHeaders extends StatelessWidget {
  const BuildHeaders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(width: 10),
        HeadersItem(flex: 1, label: "Ref"),
        HeadersItem(flex: 4, label: "Posted By"),
        HeadersItem(flex: 2, label: "Vehicle Type"),
        HeadersItem(flex: 3, label: "Origin"),
        HeadersItem(flex: 3, label: "Destination"),
        HeadersItem(
          flex: 1,
          label: "Miles",
          numberFormat: true,
        ),
        HeadersItem(
          flex: 1,
          label: "Weight",
          numberFormat: true,
        ),
        HeadersItem(
          flex: 2,
          label: "Price",
          numberFormat: true,
        ),
        HeadersItem(
          flex: 4,
          hasPadding: true,
          label: "Bid Time     ",
          numberFormat: true,
        ),
      ],
    );
  }
}
