import 'package:berbagi_app/data/datasources/local/auth_local_datasource.dart';
import 'package:berbagi_app/data/datasources/remote/auth_remote_datasource.dart';
import 'package:berbagi_app/data/model/login/request/login_request.dart';
import 'package:berbagi_app/data/model/register/request/register_request.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthLocalDatasource authLocalDatasource;
  final AuthRemoteDatasource authRemoteDatasource;

  AuthProvider({
    required this.authLocalDatasource,
    required this.authRemoteDatasource,
  });

  bool isLoadingLogin = false;
  bool isLoadingRegister = false;
  bool isLoadingLogout = false;
  bool isLoggedIn = false;

  String message = "";

  Future<bool> login(String email, String password) async {
    isLoadingLogin = true;
    notifyListeners();
    try {
      final loginData = await authRemoteDatasource
          .login(LoginRequest(email: email, password: password));

      if (loginData.error != true && loginData.loginResult!.token!.isNotEmpty) {
        isLoadingLogin = false;
        notifyListeners();

        await authLocalDatasource.login();
        notifyListeners();
        await authLocalDatasource.saveToke(loginData.loginResult!.token!);
        notifyListeners();
        isLoggedIn = await authLocalDatasource.isLoggedIn();
        notifyListeners();
        message =  loginData.message!;
        notifyListeners();
        return isLoggedIn;
      } else {
        return false;
      }
    } catch (e) {
      message = e.toString();
      isLoadingLogin = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> register(String name, String email, String password) async {
    isLoadingRegister = true;
    notifyListeners();

    try {
      final registerData = await authRemoteDatasource.register(
          RegisterRequest(name: name, email: email, password: password));
      message = registerData.message!;
      isLoadingRegister = false;
      notifyListeners();
      return true;
    } catch (e) {
      message = e.toString();
      isLoadingRegister = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> logout() async {
    isLoadingLogout = true;
    notifyListeners();

    final logout = await authLocalDatasource.isLogout();
    if (logout) {
      await authLocalDatasource.deleteToken();
      notifyListeners();
    }

    isLoggedIn = await authLocalDatasource.isLoggedIn();
    notifyListeners();
    isLoadingLogout = false;
    notifyListeners();

    return !isLoggedIn;
  }
}
