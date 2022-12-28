import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app_v2/Core/app_routes.dart';
import 'package:story_app_v2/Core/enums.dart';
import 'package:story_app_v2/Screens/Story/Provider/StoryProvider.dart';
import 'package:story_app_v2/Screens/Story/Widgets/Widgets.dart';

class Story extends StatelessWidget {
  const Story({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<StoryProvider>().getStories();
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Center(
          child: ElevatedButton(
            onPressed:() => context.read<StoryProvider>().goHome(context),
            child: const Text("Go home")
          ),
        ),
      ),
      body: Consumer<StoryProvider>(
        builder: (context, provider, _) {
          return context.read<StoryProvider>().state.status == ScreenStatus.loading ? 
            const Center(child: CircularProgressIndicator()) :
            ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemCount: context.read<StoryProvider>().state.stories.length,
              itemBuilder: (context, index) => listContents(context, index),
              padding: const EdgeInsets.only(top: 20),
            );
        },
      )
    );
  }
}