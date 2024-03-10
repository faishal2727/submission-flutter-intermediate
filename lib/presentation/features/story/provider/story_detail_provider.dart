import 'package:berbagi_app/data/datasources/remote/story_remote_datasource.dart';
import 'package:berbagi_app/data/model/story/detail_story_response.dart';
import 'package:berbagi_app/presentation/features/story/provider/story_provider.dart';
import 'package:flutter/material.dart';

class StoryDetailProvider extends ChangeNotifier {
  final StoryDatasource storyDatasource;
  final String id;

  StoryDetailProvider({
    required this.storyDatasource,
    required this.id,
  }) {
    _getDetailStory(id);
  }

  late ResultState _state = ResultState.loading;
  String _message = '';
  late DetailStoryResponse _storyDetailResponse;

  String get message => _message;
  ResultState get state => _state;
  DetailStoryResponse get story => _storyDetailResponse;

  Future<dynamic> _getDetailStory(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final dataDetail = await storyDatasource.getDetail(id);
      if (dataDetail.error != true) {
        _state = ResultState.hasData;
        notifyListeners();
        _storyDetailResponse = dataDetail;
        notifyListeners();
        return _storyDetailResponse;
      } else {
        _state = ResultState.noData;
        notifyListeners();
         _message = 'Empty Data';
        return _message;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      _message = 'Error --> $e';
      notifyListeners();
      return _message;
    }
  }
}
