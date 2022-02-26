import 'dart:io';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/widgets/dialogs.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'build_button_view.dart';
import 'package:falcon_2/views/views.dart';
import 'package:falcon_2/singletons/singletons.dart';

class Top extends ConsumerStatefulWidget {
  const Top({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  ConsumerState createState() => _TopState();
}

class _TopState extends ConsumerState<Top> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(quotedOrdersProvider).notifications;
    // final isPostedLoads = ref.watch(drawerProvider) == DrawerEnum.postedLoads;
    // final animation = ref.watch(updateAnimationProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            ref.read(drawerOpenProvider.notifier).openCloseDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        Text(
          "   ${widget.label}",
          style: MyTextStyles.interMediumFirst(
            color: MyColors.drawerHeaderColor,
            fontSize: 4.5,
          ),
        ),
        const Spacer(),
        SvgPicture.asset(
          "assets/svg1/set_notification.svg",
          color: count == 0 ? Colors.white : MyColors.redColor,
        ),
        Text(
          "$count",
          style: MyTextStyles.interMediumFirst(
            color: count == 0 ? Colors.white : MyColors.redColor,
          ),
        ),
        const SizedBox(width: 20),
        InkWell(
          onTap: () async {
            await _showPopupMenu(context);
          },
          child: const BuildButtonView(),
        ),
      ],
    );
  }

  Future<void> _showPopupMenu(BuildContext context) async {
    final openBrowserMenuText = MyPrefsFields.isOpenOnBrowser
        ? "Open on Browser (On)"
        : "Open on Browser (Off)";

    await showMenu(
      useRootNavigator: true,
      context: context,
      position: const RelativeRect.fromLTRB(10, 10, 0, 0),
      items: <PopupMenuItem>[
        PopupMenuItem(
          padding: EdgeInsets.zero,
          child: ListTile(
            title: Text(
              "Delete all Posted Loads",
              style: MyTextStyles.interMediumFirst(),
            ),
            onTap: () async {
              Navigator.pop(context, "Clear all Posted Loads");

              final result = await showYesNoDialog(
                context: context,
                message: "Are you sure you want to delete all posted loads?",
              );

              if (result) {
                OrderRepository4.clear();
              }
            },
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.zero,
          child: ListTile(
            title: Text(
              "Change Cookie",
              style: MyTextStyles.interMediumFirst(),
            ),
            onTap: () async {
              Navigator.pop(context, "Change Cookie");

              showCookieChangeDialog(context: context);
            },
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.zero,
          child: ListTile(
            title: Text(
              "Change Posted Loads Update Period",
              style: MyTextStyles.interMediumFirst(),
            ),
            onTap: () async {
              Navigator.pop(context, "Update Period");

              showUpdateSecondDialog(context: context);
            },
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.zero,
          child: ListTile(
            title: Text(
              "Log Out",
              style: MyTextStyles.interMediumFirst(),
            ),
            onTap: () async {
              Navigator.pop(context, "Log Out");

              final result = await showYesNoDialog(
                context: context,
                message: "Are you sure you want to Log Out?",
              );

              if (result) {
                final sh = await SharedPreferences.getInstance();
                await sh.clear();
                Navigator.of(context).pushReplacement(
                    MyCustomRoutes.myAnimatedRoute(const LoginPage()));
              }
            },
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.zero,
          child: ListTile(
            title: Text(
              openBrowserMenuText,
              style: MyTextStyles.interMediumFirst(),
            ),
            onTap: () async {
              Navigator.pop(context, "Open on Browser");

              final result = await showYesNoDialog(
                context: context,
                message: "Are you sure you want to open map"
                    " ${MyPrefsFields.isOpenOnBrowser ? "inside of program" : "on browser"}?",
              );

              if (result) {
                await MyPrefs()
                    .setIsOpenOnBrowser(!MyPrefsFields.isOpenOnBrowser);
              }
            },
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.zero,
          child: ListTile(
            title: Text(
              "Exit",
              style: MyTextStyles.interMediumFirst(),
            ),
            onTap: () async {
              Navigator.pop(context, "Exit");

              final result = await showYesNoDialog(
                context: context,
                message: "Are you sure you want to exit?",
              );

              if (result) {
                exit(0);
              }
            },
          ),
        ),
      ],
    );
  }
}
