///
/// Created by Abduraimbek Yarkinov at 13:15 on 18.11.2021.
///

import 'package:flutter_riverpod/flutter_riverpod.dart';

final drawerProvider =
    StateNotifierProvider.autoDispose<_DrawerNotifier, DrawerEnum>((ref) {
  return _DrawerNotifier();
});

class _DrawerNotifier extends StateNotifier<DrawerEnum> {
  _DrawerNotifier() : super(DrawerEnum.postedLoads);

  void pressDrawerItem(DrawerEnum drawerEnum) {
    if (state != drawerEnum) state = drawerEnum;
  }
}

enum DrawerEnum {
  dashboard,
  postedLoads,
  quotedLoads,
  activeShipments,
  createLoad,
  archiveShipments,
  units,
  fleetView,
  employees,
}
