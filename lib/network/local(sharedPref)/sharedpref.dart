import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  // static late  SharedPreference pref;
  static late SharedPreferences prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future SaveUserKey(String key, dynamic val) async {
    if (val is String) {
      print('the setCachdValue is: $val');
      return await prefs.setString(key, val);
    } else if (val is bool) {
      print('the setCachdValue is: $val');
      return await prefs.setBool(key, val);
    } else if (val is int) {
      print('the setCachdValue is: $val');
      return await prefs.setInt(key, val);
    } else
      return await false;
  }

  static getUserValue({required String key}) => prefs.get(key);
}
