import 'package:shared_preferences/shared_preferences.dart';

// class to make sharedPreferences
class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

// function to store any type of data
  static Future<bool> savedData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    return await sharedPreferences!.setDouble(key, value);
  }

  // function to get any type of data
  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  // make remove method to remove any type of data by key
  static Future<bool> removeData({required String key}) {
    return sharedPreferences!.remove(key);
  }
}
