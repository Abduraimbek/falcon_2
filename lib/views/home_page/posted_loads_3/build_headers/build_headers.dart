///
/// Created by Abduraimbek Yarkinov at 11:20 on 19.11.2021.
///

import 'package:flutter/material.dart';
import 'headers_item.dart';

class BuildHeaders extends StatelessWidget {
  const BuildHeaders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          HeadersItem(flex: 1, label: "Time"),
          HeadersItem(flex: 2, label: "Vehicle Type"),
          HeadersItem(flex: 3, label: "Origin"),
          HeadersItem(flex: 3, label: "Destination"),
          HeadersItem(flex: 3, label: "Posted By"),
          HeadersItem(flex: 1, label: "Order Id", alignEnd: true),
          HeadersItem(
            flex: 1,
            label: "Miles",
            alignEnd: true,
            endPadding: 25,
          ),
        ],
      ),
    );
  }
}
