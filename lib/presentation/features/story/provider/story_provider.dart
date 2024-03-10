import 'package:berbagi_app/data/datasources/remote/story_remote_datasource.dart';
import 'package:berbagi_app/data/model/story/list_story_response.dart';
import 'package:flutter/material.dart';

enum ResultState { initial, loading, noData, hasData, error }

enum ApiState {
  initial,
  loading,
  loaded,
  error,
  noData,
}

class StoryProvider extends ChangeNotifier {
  final StoryDatasource storyDatasource;

  StoryProvider({required this.storyDatasource}) {
    getAllStories();
    notifyListeners();
  }

  ApiState storiesState = ApiState.initial;
  String storiesMessage = "";

  bool storiesError = false;
  List<ListStory> stories = [];

  int? pageItems = 1;
  int sizeItem = 10;

  Future<void> getAllStories() async {
    try {
      if (pageItems == 1) {
        storiesState = ApiState.loading;
        notifyListeners();
      }

      final result = await storyDatasource.getAllStories(pageItems!, sizeItem);
      stories.addAll(result.listStory!);
      storiesMessage = "Success";
      storiesError = false;
      storiesState = ApiState.loaded;

      if (result.listStory!.length < sizeItem) {
        pageItems = null;
      } else {
        pageItems = pageItems! + 1;
      }
      notifyListeners();
    } catch (e) {
      storiesState = ApiState.error;
      storiesError = true;
      storiesMessage = "Get Stories Failed";
      notifyListeners();
    }
  }

  void reload() async {
    stories = [];
    notifyListeners();
    pageItems = 1;
    notifyListeners();
    storiesMessage = "";
    notifyListeners();
    await getAllStories();
  }
}
