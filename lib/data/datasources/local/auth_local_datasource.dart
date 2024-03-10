import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  final String auth = "auth_state";
  final String myToken = "token";

  Future<bool> login() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setBool(auth, true);
  }

  Future<bool> isLoggedIn() async {
    final preferences = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(milliseconds: 2000));
    return preferences.getBool(auth) ?? false;
  }

  Future<bool> isLogout() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setBool(auth, false);
  }

  Future<bool> saveToke(String token) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(myToken, token);
  }

  Future<String> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(myToken) ?? "";
  }

  Future<bool> deleteToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(myToken, "");
  }
}
