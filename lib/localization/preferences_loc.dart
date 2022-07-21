import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBooleanLan({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }

  static  getBooleanLan({
    required String key,
  }) {
    return sharedPreferences.getBool(key);
  }

}