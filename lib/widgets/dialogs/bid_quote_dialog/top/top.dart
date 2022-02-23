///
/// Created by Abduraimbek Yarkinov at 10:37 on 22.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';

class Top extends ConsumerWidget {
  const Top({
    Key? key,
    required this.refId,
  }) : super(key: key);

  final String refId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  "Quoted RFQ $ref",
                  style: MyTextStyles.interMediumFirst(
                    color: Colors.white,
                    fontSize: 3.5,
                  ),
                ),
              ),
              CloseButton(
                onPressed: () {
                  ref.read(chattingProvider).onDispose();
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
