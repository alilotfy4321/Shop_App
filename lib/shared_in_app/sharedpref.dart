// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures

import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  // static late  SharedPreference pref;
  static late SharedPreferences prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future saveUserCacheKey(String key, dynamic val) async {
    if (val is String) {
      print('the setCachdValue is: $val');
      return await prefs.setString(key, val);
    } else if (val is bool) {
      print('the setCachdValue is: $val');
      return await prefs.setBool(key, val);
    } else if (val is int) {
      print('the setCachdValue is: $val');
      return await prefs.setInt(key, val);
    } else if (val is double) {
      print('the setCachdValue is: $val');
      return await prefs.setDouble(key, val);
    } else
      return false;
  }

  static getUserCachedValue({required String key}) {
    return prefs.get(key);
  }

  static Future removeCachedDate(String key) async {
    return await prefs.remove(key);
  }
}
