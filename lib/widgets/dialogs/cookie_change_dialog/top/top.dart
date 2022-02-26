///
/// Created by Abduraimbek Yarkinov at 18:01 on 27.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class Top extends StatelessWidget {
  const Top({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        color: MyColors.backgroundColor,
        child: SizedBox(
          width: double.infinity,
          height: 4.vertical,
          child: Row(
            children: [
              const SizedBox(width: 22),
              Text(
                "Change Cookie",
                style: MyTextStyles.interMediumFirst(
                  color: Colors.white,
                  fontSize: 3.8,
                ),
              ),
              const Spacer(),
              // IconButton(
              //   onPressed: onPressed,
              //   icon: const Icon(
              //     Icons.sync,
              //     color: Colors.white,
              //   ),
              // ),
              CloseButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ),
    );
  }
}
