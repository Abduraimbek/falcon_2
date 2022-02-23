///
/// Created by Abduraimbek Yarkinov at 17:08 on 06.01.2022.
///

import 'package:cached_network_image/cached_network_image.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({
    Key? key,
    required this.message,
  }) : super(key: key);

  final SendMessageModel message;

  @override
  Widget build(BuildContext context) {
    final titleStyle = MyTextStyles.interMediumFirst(fontSize: 3.6);
    final subtitleStyle = MyTextStyles.interMediumFirst(fontSize: 2.7);

    return Padding(
      padding: EdgeInsets.only(
        left: message.isSend ? 40 : 10,
        right: message.isSend ? 10 : 40,
        top: 5,
        bottom: 5,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: message.isSend
              ? MyColors.backgroundColor.withOpacity(.3)
              : Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.black26,
            width: 1,
          ),
        ),
        child: Builder(
          builder: (context) {
            if (message.isSend) {
              if (message.contentType == 1) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.text == "" ? "COULDN'T PARSE" : message.text,
                      style: titleStyle,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            message.createdData,
                            textAlign: TextAlign.end,
                            style: subtitleStyle,
                          ),
                          message.sending
                              ? Icon(
                                  Icons.access_time_rounded,
                                  size: .5.diagonal,
                                  color: Colors.black,
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return message.sending == false
                    ? CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: MessageApi.getImageUrl(message.image ?? ""),
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 1.diagonal,
                            height: 1.diagonal,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text("Sending image", style: titleStyle),
                        ],
                      );
              }
            } else {
              if (message.contentType == 1) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.text == "" ? "COULDN'T PARSE" : message.text,
                      style: titleStyle,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        message.createdData,
                        textAlign: TextAlign.end,
                        style: subtitleStyle,
                      ),
                    ),
                  ],
                );
              } else {
                return message.uint8list != null
                    ? Image.memory(message.uint8list!)
                    : Text("Couldn't get image", style: titleStyle);
              }
            }
          },
        ),
      ),
    );
  }
}
