import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:story_app_v2/Data/Core/ApiRoutes.dart';

import '../../Models/Story Model/StoryModel.dart';

class StoryService {
  Future<List<StoryModel>> fetchStories() async {
    Response response = await http.get(Uri.parse(ApiRoutes.storyUrl));
    List<StoryModel> stories = storyModelFromJson(response.body);
    return stories;
  }
}