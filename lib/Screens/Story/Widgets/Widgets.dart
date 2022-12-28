import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../Provider/StoryProvider.dart';

Widget listContents(BuildContext context, int index) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(15)
    ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(context.read<StoryProvider>().state.stories[index].userPhoto!),
          radius: 30,
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(context.read<StoryProvider>().state.stories[index].username!, style: const TextStyle(fontSize: 20)),
            Text("Number of stories : ${context.read<StoryProvider>().state.stories[index].userStory!.length}")
          ],
        ),
        const SizedBox(width: 20),
        Text(timeago.format(context.read<StoryProvider>().state.stories[index].storyTime!), style: const TextStyle(fontSize: 20),)
      ],
    ),
  );
}