///
/// Created by Abduraimbek Yarkinov at 17:55 on 11.01.2022.
///

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatOrInfoProvider =
    ChangeNotifierProvider.autoDispose<_ChatOrInfo>((ref) {
  return _ChatOrInfo();
});

class _ChatOrInfo extends ChangeNotifier {
  bool isInfo = true;
  bool isFalcon = true;

  void changeChatOrInfo(bool value) {
    if (isInfo != value) {
      isInfo = value;
      notifyListeners();
    }
  }

  void changeFalconOrAzam(bool value) {
    if (isFalcon != value) {
      isFalcon = value;
      notifyListeners();
    }
  }
}
