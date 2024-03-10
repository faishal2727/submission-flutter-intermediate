
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'post_story_response.freezed.dart';
part 'post_story_response.g.dart';

@freezed
class PostStoryResponse with _$PostStoryResponse {
  const factory PostStoryResponse({
    @JsonKey(name: 'error') bool? error,
    @JsonKey(name: 'message') String? message,
  }) = _PostStoryResponse;

  factory PostStoryResponse.fromJson(Map<String, dynamic> json) =>
      _$PostStoryResponseFromJson(json);
}

// import 'dart:convert';

// class PostStoryResponse {
//   final bool error;
//   final String message;
 
//   PostStoryResponse({
//     required this.error,
//     required this.message,
//   });
 
//   factory PostStoryResponse.fromMap(Map<String, dynamic> map) {
//     return PostStoryResponse(
//       error: map['error'] ?? false,
//       message: map['message'] ?? '',
//     );
//   }
 
//   factory PostStoryResponse.fromJson(String source) =>
//       PostStoryResponse.fromMap(json.decode(source));
// }
