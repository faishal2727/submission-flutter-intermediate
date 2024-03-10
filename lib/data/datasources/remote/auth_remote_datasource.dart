import 'dart:convert';

import 'package:berbagi_app/data/model/login/request/login_request.dart';
import 'package:berbagi_app/data/model/login/response/login_response.dart';
import 'package:berbagi_app/data/model/register/request/register_request.dart';
import 'package:berbagi_app/data/model/register/response/register_response.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  static const String baseUrl = 'https://story-api.dicoding.dev/v1';
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/register"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          registerRequest.toJson(),
        ),
      );

      if (response.statusCode == 201) {
        return RegisterResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception("Failed to Register");
      }
    } catch (error) {
      throw Exception("Failed to Register");
    }
  }

  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          loginRequest.toJson(),
        ),
      );

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception("Failed to Login");
      }
    } catch (error) {
      throw Exception("Failed to Login");
    }
  }
}
