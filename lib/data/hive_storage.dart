import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  static late Box box;
  // static late Box<GoogleUserModel> box1;

  // Initialize the boxes and register adapters
  static Future<void> init() async {
    await Hive.initFlutter();

    // Register the GoogleUserModel adapter
    // Hive.registerAdapter(GoogleUserModelAdapter());
    // Hive.registerAdapter(UserModelAdapter());

    box = await Hive.openBox('myBox');
    // box1 = await Hive.openBox<GoogleUserModel>('googleUserBox');
    // box2 = await Hive.openBox<UserModel>('userBox');
  }

  // Get value from the generic box
  static dynamic get(String key) {
    try {
      return box.get(key, defaultValue: null);
    } catch (e) {
      return null;
    }
  }

  // Set value in the generic box
  static Future<void> set(String key, dynamic value) async {
    await box.put(key, value);
  }

  // Remove value from the generic box
  static Future<void> remove(String key) async {
    await box.delete(key);
  }

  // Clear all data in the generic box
  static Future<void> clear() async {
    await box.clear();
  }

  // // Save GoogleUserModel to the box
  // static Future<void> saveGoogleUser(GoogleUserModel user) async {

  //   await box1.put(HiveKeys.userGData, user);
  // }

  // // Retrieve the GoogleUserModel from the box
  // static GoogleUserModel? getGoogleUser() {
  //   return box1.get(HiveKeys.userGData);
  // }

  // // Save UserModel to the box
  // static Future<void> saveDefaultUser(UserModel user) async {
  //   await box2.put(HiveKeys.userDData, user);
  // }

  // // Retrieve the UserModel from the box
  // static UserModel? getDefaultUser() {
  //   return box2.get(HiveKeys.userDData);
  // }

  // static Future<void> logOut() async {
  //   // await box.clear();
  //   await box1.clear();
  //   await box2.clear();
  // }
}
