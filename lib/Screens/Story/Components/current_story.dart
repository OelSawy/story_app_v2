import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app_v2/Screens/Story/Provider/StoryProvider.dart';
import 'package:story_view/story_view.dart';
import 'package:story_app_v2/Data/Models/Story%20Model/StoryModel.dart';

class CurrentStory extends StatelessWidget {
  final StoryController storyController = StoryController();
  StoryModel userStory;
  CurrentStory({super.key, required this.userStory});
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: context.read<StoryProvider>().state.stories.length,
        itemBuilder: (context, index) {
          StoryModel storyData = context.read<StoryProvider>().state.stories[index];
          List<StoryItem?> items = [];
          for (var e in storyData.userStory!) {
            if (e.type == Type.TEXT) {
              items.add(StoryItem.text(title: e.body!, backgroundColor: Colors.black));
            }
            if (e.type == Type.IMAGE) {
              items.add(StoryItem.pageImage(url: e.body!, controller: storyController));
            }
          }
          return Stack(
            children: [
              StoryView(
                onComplete: () => pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.easeIn),
                storyItems: items,
                controller: storyController
              ),
              Positioned(
                top: 60,
                left: 16,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(storyData.userPhoto!),
                  radius: 30,
                )
              ),
              Positioned(
                top: 75,
                left: 90,
                child: Text(storyData.username!, style: const TextStyle(fontSize: 25, color: Colors.white))
              )
            ],
          );
        },
      )
    );
  }
}