///
/// Created by Abduraimbek Yarkinov at 17:18 on 16.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(loginButtonProvider);

    return MaterialButton(
      onPressed: provider
          ? () {
              ref.read(loginButtonProvider.notifier).pressLoginButton(context);
            }
          : null,
      color: MyColors.orangeColor,
      disabledColor: MyColors.orangeColor.withOpacity(.4),
      child: Text(
        "Log in",
        style: MyTextStyles.interMediumFirst(
          color: Colors.white,
        ),
      ),
    );
  }
}
