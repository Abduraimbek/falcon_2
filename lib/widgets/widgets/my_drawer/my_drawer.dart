///
/// Created by Abduraimbek Yarkinov at 13:14 on 18.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';
import 'menus/menus.dart';
import 'top/top.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({
    Key? key,
    required this.child,
    required this.label,
  }) : super(key: key);

  final Widget child;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawerInt = ref.watch(drawerOpenProvider);

    return Row(
      children: [
        drawerInt == 1
            ? const SizedBox()
            : SizedBox(
                height: double.infinity,
                width: 12.15.horizontal,
                child: const Menus(),
              ),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 5.57.vertical,
                width: double.infinity,
                child: Top(label: label),
              ),
              Expanded(child: child),
            ],
          ),
        ),
      ],
    );
  }
}
