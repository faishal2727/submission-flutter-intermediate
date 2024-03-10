// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'error') bool? error,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'loginResult') LoginResult? loginResult,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class LoginResult with _$LoginResult {
  const factory LoginResult({
    @JsonKey(name: 'userId') String? userId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'token') String? token,
  }) = _LoginResult;

  factory LoginResult.fromJson(Map<String, Object?> json) =>
      _$LoginResultFromJson(json);
}


// part 'login_response.g.dart';

// @JsonSerializable()
// class LoginResponse {
//   final bool error;
//   final String message;
//   final LoginResult loginResult;

//   LoginResponse({
//     required this.error,
//     required this.message,
//     required this.loginResult,
//   });

//   factory LoginResponse.fromJson(Map<String, dynamic> json) =>
//       _$LoginResponseFromJson(json);

//   Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
// }


// class LoginResponse {
//     bool error;
//     String message;
//     LoginResult loginResult;

//     LoginResponse({
//         required this.error,
//         required this.message,
//         required this.loginResult,
//     });

//     factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
//         error: json["error"],
//         message: json["message"],
//         loginResult: LoginResult.fromJson(json["loginResult"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "error": error,
//         "message": message,
//         "loginResult": loginResult.toJson(),
//     };
// }
