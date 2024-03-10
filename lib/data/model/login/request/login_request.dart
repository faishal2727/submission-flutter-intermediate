// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'login_request.freezed.dart';
part 'login_request.g.dart';

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'password') String? password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}



// import 'dart:convert';

// class LoginRequest {
//   LoginRequest({
//     required this.email,
//     required this.password,
//   });

//   String email;
//   String password;

//   Map<String, dynamic> toMap() {
//     return {"email": email, "password": password};
//   }

//   String toJson() => json.encode(toMap());
// }
