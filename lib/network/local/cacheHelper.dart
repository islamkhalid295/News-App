import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static late SharedPreferences sharedPreferences;
  static Future<SharedPreferences> init () async
  {
    return sharedPreferences = await SharedPreferences.getInstance();

  }
  static Future<bool?>? putboolean ({required String key, required bool value}) async
  {
    return await sharedPreferences?.setBool(key, value).then((value) {
      print("shared : ${sharedPreferences?.getBool(key)}") ;
    });
  }

  static bool? getboolean ({required String key})
  {
    return  sharedPreferences?.getBool(key);
  }
}