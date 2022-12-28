import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:story_app_v2/Data/Models/Story%20Model/StoryModel.dart';

class CurrentStory extends StatelessWidget {
  final StoryController controller = StoryController();
  StoryModel userStory;
  CurrentStory({super.key, required this.userStory});
  List<StoryItem?> items = [];
  @override
  Widget build(BuildContext context) {
    for (var e in userStory.userStory!) {
      if (e.type == Type.TEXT) {
        items.add(StoryItem.text(title: e.body!, backgroundColor: Colors.black));
      }
      if (e.type == Type.IMAGE) {
        items.add(StoryItem.pageImage(url: e.body!, controller: controller));
      }
    }
    return Scaffold(
      body: Stack(
        children: [
          StoryView(
            onComplete: () => Navigator.of(context).pop(),
            storyItems: items,
            controller: controller
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Image.network(userStory.userPhoto!)
          )
        ],
      )
    );
  }
}