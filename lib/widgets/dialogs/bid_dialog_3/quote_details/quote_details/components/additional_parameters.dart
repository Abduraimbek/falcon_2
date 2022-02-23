import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/utils/utils.dart';

class AdditionalParameters extends ConsumerWidget {
  const AdditionalParameters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = MyTextStyles.interMediumFirst(fontSize: 3.3);

    final asyncValue = ref.watch(additionalParametersProvider);
    final selectedList = ref.watch(quoteDetailsProvider).parameters;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Additional Parameters", style: style),
        const SizedBox(height: 10),
        asyncValue.when(
          data: (list) {
            if (list != null && list.isNotEmpty) {
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                padding: EdgeInsets.zero,
                childAspectRatio: 5,
                children: list
                    .map(
                      (e) => buildItem(
                        checked:
                            selectedList.any((element) => element.id == e.id),
                        style: style,
                        title: e.name ?? "-",
                        onChanged: (value) {
                          if (value == true) {
                            ref.read(quoteDetailsProvider).addToParameters(e);
                          } else if (value == false) {
                            ref
                                .read(quoteDetailsProvider)
                                .removeFromParameters(e.id ?? 0);
                          }
                        },
                      ),
                    )
                    .toList(),
              );
            } else {
              return const SizedBox();
            }
          },
          error: (_, __) => const SizedBox(),
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: MyColors.backgroundColor,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildItem({
    required bool checked,
    required TextStyle style,
    required String title,
    required Function(bool? value)? onChanged,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: checked,
          onChanged: onChanged,
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
