import 'package:hive_flutter/hive_flutter.dart';
import 'package:meet_ava_take_home/common/repository/user_data_adapter.dart';

import '../user_data.dart';

class HiveStorageService {
  static const _boxName = 'singleUserData';
  static const _userKey = 'currentUser';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserDataAdapter());
  }

  static Future<void> saveUserData(UserData user) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_userKey, user);
  }

  static Future<UserData> getUserData() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_userKey);
  }

  static Future<void> clear() async {
    final box = await Hive.openBox(_boxName);
    await box.clear();
  }
}
