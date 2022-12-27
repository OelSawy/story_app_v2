import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app_v2/Screens/Splash/Provider/SplashProvider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashProvider>().handleDate(context);
    return Scaffold(
      body: Center(child: Image.asset("assets/images/Logo.png")),
      backgroundColor: Colors.blueGrey,
    );
  }
}