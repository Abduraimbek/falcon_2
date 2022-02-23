///
/// Created by Abduraimbek Yarkinov at 10:37 on 22.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        color: MyColors.backgroundColor,
        child: SizedBox(
          height: 4.vertical,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 30),
              Expanded(
                child: Text(
                  "Google Maps",
                  style: MyTextStyles.interMediumFirst(
                    color: Colors.white,
                    fontSize: 3.5,
                  ),
                ),
              ),
              CloseButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.white,
              ),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ),
    );
  }
}
