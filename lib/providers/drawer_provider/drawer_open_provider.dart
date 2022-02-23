///
/// Created by Abduraimbek Yarkinov at 18:02 on 17.12.2021.
///

import 'package:flutter_riverpod/flutter_riverpod.dart';

final drawerOpenProvider =
    StateNotifierProvider<_DrawerOpenNotifier, int>((ref) {
  return _DrawerOpenNotifier();
});

class _DrawerOpenNotifier extends StateNotifier<int> {
  _DrawerOpenNotifier() : super(1);

  void openCloseDrawer() {
    if (state == 1) {
      state = 2;
    } else {
      state = 1;
    }
  }
}
