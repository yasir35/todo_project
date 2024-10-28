import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  /// Initializes Hive for Flutter and opens the required box.
  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    await Hive.openBox('todoBox');
  }
}
