import 'package:berbagi_app/data/model/story/list_story_response.dart';
import 'package:flutter/material.dart';

class CardStory extends StatelessWidget {
  final ListStory story;
  final Function() onTapped;

  const CardStory({
    super.key,
    required this.story,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          onTapped();
        },
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: Hero(
            tag: story.name!,
            child: Image.network(
              story.photoUrl!,
              width: 100,
            ),
          ),
          title: Text(
            story.name!,
          ),
        ),
      ),
    );
  }
}
