import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class LocalStorage {
  static Future<void> initializeHive() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(path.join(directory.path, 'hive_boxes'));
    await Hive.openBox('historyBox');
  }
}

