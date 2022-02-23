import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/utils/utils.dart';

class AdditionalParameters extends ConsumerWidget {
  const AdditionalParameters({
    Key? key,
    required this.addParams,
  }) : super(key: key);

  final String addParams;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = MyTextStyles.interMediumFirst(fontSize: 3.3);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Additional Parameters", style: style),
        Text(
          addParams,
          style: style,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildItem({
    required TextStyle style,
    required String title,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: true,
          onChanged: (v) {},
          activeColor: MyColors.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Text(title, style: style),
      ],
    );
  }
}
