import 'package:falcon_2/objectbox.g.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;

class MyObjectbox {
  static late Store store;

  static Future<void> init() async {
    final dir = await path_provider.getApplicationSupportDirectory();

    store = Store(
      getObjectBoxModel(),
      directory: path.join(dir.path, "falcon_db"),
    );
  }
}
