///
/// Created by Abduraimbek Yarkinov at 14:24 on 22.11.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class BottomTop extends StatelessWidget {
  const BottomTop({
    Key? key,
    required this.model,
  }) : super(key: key);

  final QuoteByIdOrderModel model;

  @override
  Widget build(BuildContext context) {
    final style2 = MyTextStyles.interMediumSecond(fontSize: 3.4);
    final style = MyTextStyles.interMediumFirst(fontSize: 3.5);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Minimum Dimension",
                      style: style,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      MyStringHelper.minusWhenNull(model.dims),
                      maxLines: 1,
                      style: style2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text("Special Requirements", style: style),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("N/A", style: style2),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Notes",
                      style: style,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      MyStringHelper.minusWhenNull(model.notes),
                      style: style2,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
