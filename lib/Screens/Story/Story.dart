import 'package:flutter/material.dart';
import 'package:story_app_v2/Core/app_routes.dart';

class Story extends StatelessWidget {
  const Story({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false),
          icon: const Icon(Icons.arrow_back),
          iconSize: 40
        ),
      ),
      body: const Center(
        child: Text("Stories")
      )
    );
  }
}