// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'detail_story_response.freezed.dart';
part 'detail_story_response.g.dart';

@freezed
class DetailStoryResponse with _$DetailStoryResponse {
  const factory DetailStoryResponse({
    @JsonKey(name: 'error') bool? error,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'story') Story? story,
  }) = _DetailStoryResponse;

  factory DetailStoryResponse.fromJson(Map<String, Object?> json) => _$DetailStoryResponseFromJson(json);
}

@freezed
class Story with _$Story {
  const factory Story({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'photoUrl') String? photoUrl,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'lat') double? lat,
    @JsonKey(name: 'lon') double? lon,
  }) = _Story;

  factory Story.fromJson(Map<String, Object?> json) => _$StoryFromJson(json);
}


// import 'package:berbagi_app/data/model/story/story.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'DetailStoryResponse_story_response.g.dart';

// @JsonSerializable()
// class DetailStoryResponse {
//   final bool error;
//   final String message;
//   final Story story;

//   DetailStoryResponse({
//     required this.error,
//     required this.message,
//     required this.story,
//   });

//   factory DetailStoryResponse.fromJson(Map<String, dynamic> json) =>
//       _$DetailStoryResponseFromJson(json);

//   Map<String, dynamic> toJson() => _$DetailStoryResponseToJson(this);
// }

