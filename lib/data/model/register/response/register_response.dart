import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response.freezed.dart';
part 'register_response.g.dart';

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'error') bool? error,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'message') String? message,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, Object?> json) =>
      _$RegisterResponseFromJson(json);
}


// class RegisterResponse {
//     bool error;
//     String message;

//     RegisterResponse({
//         required this.error,
//         required this.message,
//     });

//     factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
//         error: json["error"],
//         message: json["message"],
//     );

//     Map<String, dynamic> toJson() => {
//         "error": error,
//         "message": message,
//     };
// }


// import 'package:json_annotation/json_annotation.dart';

// part 'register_response.g.dart';

// @JsonSerializable()
// class RegisterResponse {
//   final bool error;
//   final String message;

//   RegisterResponse({
//     required this.error,
//     required this.message,
//   });

//   factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
//       _$RegisterResponseFromJson(json);

//   Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
// }