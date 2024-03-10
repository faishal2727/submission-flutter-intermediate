// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'password') String? password,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);
}


// import 'dart:convert';

// class RegisterRequest {
//   RegisterRequest({
//     required this.name,
//     required this.email,
//     required this.password,
//   });

//   String name;
//   String email;
//   String password;

//   Map<String, dynamic> toMap() {
//     return {"name": name, "email": email, "password": password};
//   }

//   String toJson() => json.encode(toMap());
// }
