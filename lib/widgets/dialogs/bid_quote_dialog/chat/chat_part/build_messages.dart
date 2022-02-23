///
/// Created by Abduraimbek Yarkinov at 17:59 on 22.11.2021.
///

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';
import 'build_item.dart';

class BuildMessages extends ConsumerStatefulWidget {
  const BuildMessages({
    Key? key,
    required this.gmail,
    required this.isFalcon,
    required this.subject,
  }) : super(key: key);

  final String gmail;
  final bool isFalcon;
  final String subject;

  @override
  ConsumerState createState() => _BuildMessagesState();
}

class _BuildMessagesState extends ConsumerState<BuildMessages> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    final p = ref.read(chattingProvider);
    p.subject = widget.subject;
    p.isFalcon = widget.isFalcon;
    p.shouldFetchMessages = true;
    p.fetchMessagesWithCompleter();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(chattingProvider).messages.reversed.toList();

    if (list.isNotEmpty) {
      return ListView.builder(
        reverse: true,
        controller: scrollController,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];

          return BuildItem(message: item);
        },
      );
    } else {
      return buildNoMessage();
    }
  }

  Widget buildNoMessage() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg1/not_messages_yet.svg",
            fit: BoxFit.cover,
            width: 7.13.vertical,
            height: 7.13.vertical,
          ),
          const SizedBox(height: 15),
          Text(
            "There are no messages yet.\n"
            "To start as conversation just send a message\n"
            "to your counterpart.",
            textAlign: TextAlign.center,
            style: MyTextStyles.interMediumFirst(
              color: const Color(0xff000000).withOpacity(.6),
              fontSize: 3.8,
            ),
          ),
        ],
      ),
    );
  }
}
