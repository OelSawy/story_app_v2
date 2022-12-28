import 'package:story_app_v2/Core/enums.dart';
import 'package:story_app_v2/Data/Models/Story%20Model/StoryModel.dart';

class StoryState {
  List<StoryModel> stories = [];
  ScreenStatus status = ScreenStatus.loading;
}