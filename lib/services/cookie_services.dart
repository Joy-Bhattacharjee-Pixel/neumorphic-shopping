import 'package:shared_preferences/shared_preferences.dart';

/// This file is for the saving all cookies

/// Saving cookie
saveCookie({String? key, String? value}) async {
  /// Creating instance of shared preferenes
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  /// Saving the key value pair
  await sharedPreferences.setString(key!, value.toString());
}

/// Retriving cookie
Future<String?> getCookie({String? key}) async {
  /// Creating instance of shared preferenes
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  /// Getting the value for the key
  final value = sharedPreferences.getString(key!);
  return value;
}

/// Deleting cookie
deleteCookie({String? key}) async {
  /// Creating instance of shared preferenes
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  /// Getting the value for the key
  await sharedPreferences.remove(key!);
}
