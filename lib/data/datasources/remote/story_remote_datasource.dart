import 'dart:convert';
import 'dart:typed_data';

import 'package:berbagi_app/data/datasources/local/auth_local_datasource.dart';
import 'package:berbagi_app/data/model/story/detail_story_response.dart';
import 'package:berbagi_app/data/model/story/list_story_response.dart';
import 'package:berbagi_app/data/model/story/post_story_response.dart';
import 'package:http/http.dart' as http;

class StoryDatasource {
  static const String baseUrl = 'https://story-api.dicoding.dev/v1';

  final AuthLocalDatasource authLocalDatasource = AuthLocalDatasource();
  Future<Map<String, String>> getHeaders() async {
    String token = await authLocalDatasource.getToken();
    return {
      "Authorization": "Bearer $token",
    };
  }

  Future<ListStoryResponse> getAllStories([int page = 1, int size = 5]) async {
    final token = await authLocalDatasource.getToken();
    final response = await http.get(
        Uri.parse("$baseUrl/stories?page=$page&size=$size"),
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      return ListStoryResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to get all stories");
    }
  }

  Future<DetailStoryResponse> getDetail(String id) async {
    final token = await authLocalDatasource.getToken();
    final response = await http.get(Uri.parse("$baseUrl/stories/$id"),
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      return DetailStoryResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load detail");
    }
  }

  Future<PostStoryResponse> postStory(
    List<int> bytes,
    String fileName,
    String description,
    double lat,
    double lon,
  ) async {
    try {
      final uri = Uri.parse("$baseUrl/stories");
      var request = http.MultipartRequest('POST', uri);

      final multiPartFile =
          http.MultipartFile.fromBytes("photo", bytes, filename: fileName);
      final Map<String, String> fields = {
        "description": description,
        "lat": lat.toString(),
        "lon": lon.toString(),
      };

      request.files.add(multiPartFile);
      request.fields.addAll(fields);
      request.headers.addAll(await getHeaders());

      final http.StreamedResponse streamedResponse = await request.send();
      final int statusCode = streamedResponse.statusCode;

      final Uint8List responseList = await streamedResponse.stream.toBytes();
      final String responseData = String.fromCharCodes(responseList);

      if (statusCode == 201) {
        final PostStoryResponse upload =
            PostStoryResponse.fromJson(json.decode(responseData));
        return upload;
      } else {
        throw Exception("Upload story is Gagal");
      }
    } catch (error) {
      throw Exception("Failed to post story");
    }
  }
}
