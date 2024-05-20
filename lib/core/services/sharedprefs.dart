import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferences? sharedPreferences;
  static initSharedPrefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveUserID(int userID) async {
    sharedPreferences!.setInt("userID", userID);
  }

  static int? getUserID() {
    return sharedPreferences!.getInt('userID');
  }

  static deleteUserID() async {
    sharedPreferences!.remove("userID");
  }

  static bool? isFirstTime() {
    return sharedPreferences!.getBool("isFirstTime");
  }
}
