// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'list_story_response.freezed.dart';
part 'list_story_response.g.dart';

@freezed
class ListStoryResponse with _$ListStoryResponse {
  const factory ListStoryResponse({
    @JsonKey(name: 'error') bool? error,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'listStory') List<ListStory>? listStory,
  }) = _ListStoryResponse;

  factory ListStoryResponse.fromJson(Map<String, Object?> json) =>
      _$ListStoryResponseFromJson(json);
}

@freezed
class ListStory with _$ListStory {
  const factory ListStory({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'photoUrl') String? photoUrl,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'lat') double? lat,
    @JsonKey(name: 'lon') double? lon,
  }) = _ListStory;

  factory ListStory.fromJson(Map<String, Object?> json) =>
      _$ListStoryFromJson(json);
}

// class ListStoryResponse {
//     bool error;
//     String message;
//     List<ListStory> listStory;

//     ListStoryResponse({
//         required this.error,
//         required this.message,
//         required this.listStory,
//     });

//     factory ListStoryResponse.fromJson(Map<String, dynamic> json) => ListStoryResponse(
//         error: json["error"],
//         message: json["message"],
//         listStory: List<ListStory>.from(json["listStory"].map((x) => ListStory.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "error": error,
//         "message": message,
//         "listStory": List<dynamic>.from(listStory.map((x) => x.toJson())),
//     };
// }


// class ListStory {
//     String? id;
//     String? name;
//     String? description;
//     String? photoUrl;
//     DateTime createdAt;
//     double? lat;
//     double? lon;

//     ListStory({
//         required this.id,
//         required this.name,
//         required this.description,
//         required this.photoUrl,
//         required this.createdAt,
//         required this.lat,
//         required this.lon,
//     });

//     factory ListStory.fromJson(Map<String, dynamic> json) => ListStory(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         photoUrl: json["photoUrl"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         lat: json["lat"]?.toDouble(),
//         lon: json["lon"]?.toDouble(),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "photoUrl": photoUrl,
//         "createdAt": createdAt.toIso8601String(),
//         "lat": lat,
//         "lon": lon,
//     };
// }
