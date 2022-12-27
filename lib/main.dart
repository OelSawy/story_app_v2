import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app_v2/Core/app_routes.dart';
import 'package:story_app_v2/Screens/Contacts/Contacts.dart';
import 'package:story_app_v2/Screens/Contacts/Provider/ContactsProvider.dart';
import 'package:story_app_v2/Screens/Home/Home.dart';
import 'package:story_app_v2/Screens/Home/Provider/HomeProvider.dart';
import 'package:story_app_v2/Screens/Log%20In/Provider/logInProvider.dart';
import 'package:story_app_v2/Screens/Log%20In/logIn.dart';
import 'package:story_app_v2/Screens/Splash/Provider/SplashProvider.dart';
import 'package:story_app_v2/Screens/Splash/SplashScreen.dart';
import 'package:story_app_v2/Screens/Story/Provider/StoryProvider.dart';
import 'package:story_app_v2/Screens/Story/Story.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashProvider>(create: (context) => SplashProvider()),
        ChangeNotifierProvider<LogInProvider>(create: (context) => LogInProvider()),
        ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
        ChangeNotifierProvider<StoryProvider>(create: (context) => StoryProvider()),
        ChangeNotifierProvider<ContactsProvider>(create: (context) => ContactsProvider())
      ],
      child: MaterialApp(
        title: "Story App",
        routes: {
          AppRoutes.init :(context) => const SplashScreen(),
          AppRoutes.home :(context) => const Home(),
          AppRoutes.login :(context) => const LogIn(),
          AppRoutes.story :(context) => const Story(),
          AppRoutes.contacts :(context) => const Contacts()
        },
      ),
    );
  }
}