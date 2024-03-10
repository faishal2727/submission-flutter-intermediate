import 'package:berbagi_app/data/datasources/remote/story_remote_datasource.dart';
import 'package:berbagi_app/data/model/story/post_story_response.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class PostProvider extends ChangeNotifier {
  final StoryDatasource storyDatasource;
  PostProvider({required this.storyDatasource});
  bool isUploadLoaading = false;
  String message = "";
   bool error = true;
  PostStoryResponse? postStoryResponse;

  Future<void> postStory(
    List<int> bytes,
    String fileName,
    String description,
    double lat,
    double lon,
  ) async {
    try{
      message = "";
      postStoryResponse = null;
      isUploadLoaading = true;
      notifyListeners();

      postStoryResponse = await storyDatasource.postStory(bytes, fileName, description, lat, lon,);
      message = postStoryResponse?.message?? "succes";
      error = postStoryResponse?.error?? true;
      isUploadLoaading = false;
      notifyListeners();
    } catch (e) {
      isUploadLoaading = false;
      message = e.toString();
      notifyListeners();
    }
  }

  Future<List<int>> compressImage(List<int> bytes) async {
    int imageLength = bytes.length;
    if (imageLength < 1000000) return bytes;

    final img.Image image = img.decodeImage(bytes)!;
    int compressQuality = 100;
    int length = imageLength;
    List<int> newByte = [];

    do {
      ///
      compressQuality -= 10;

      newByte = img.encodeJpg(
        image,
        quality: compressQuality,
      );

      length = newByte.length;
    } while (length > 1000000);

    return newByte;
  }

  Future<List<int>> resizeImage(List<int> bytes) async {
    int imageLength = bytes.length;
    if (imageLength < 1000000) return bytes;

    final img.Image image = img.decodeImage(bytes)!;
    bool isWidthMoreTaller = image.width > image.height;
    int imageTall = isWidthMoreTaller ? image.width : image.height;
    double compressTall = 1;
    int length = imageLength;
    List<int> newByte = bytes;

    do {
      ///
      compressTall -= 0.1;

      final newImage = img.copyResize(
        image,
        width: isWidthMoreTaller ? (imageTall * compressTall).toInt() : null,
        height: !isWidthMoreTaller ? (imageTall * compressTall).toInt() : null,
      );

      length = newImage.length;
      if (length < 1000000) {
        newByte = img.encodeJpg(newImage);
      }
    } while (length > 1000000);

    return newByte;
  }

}
