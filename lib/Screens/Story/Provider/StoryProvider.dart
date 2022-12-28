import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:story_app_v2/Core/app_routes.dart';
import 'package:story_app_v2/Core/enums.dart';
import 'package:story_app_v2/Screens/Story/Provider/StoryState.dart';
import '../../../Data/Services/Story Service/story_service.dart';

class StoryProvider extends ChangeNotifier {
  StoryState state = StoryState();

  void getStories() async {
    state.stories = await StoryService().fetchStories();
    state.status = ScreenStatus.done;
    notifyListeners();
  }

  goHome(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
  }
}
