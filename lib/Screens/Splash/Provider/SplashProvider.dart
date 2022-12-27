import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app_v2/Data/Models/Login%20Model/LoginModel.dart';
import 'package:story_app_v2/Screens/Log%20In/Provider/logInProvider.dart';
import 'package:story_app_v2/Screens/Splash/Provider/SplashState.dart';

import '../../../Core/app_routes.dart';

class SplashProvider extends ChangeNotifier {
  SplashState state = SplashState();

  Future<void> handleDate(BuildContext context) async {

    await Future.delayed(const Duration(seconds: 2)).then((value) async { 
      SharedPreferences shared = await SharedPreferences.getInstance();
      if (shared.containsKey("AccountData")) {
        var userData = json.decode(shared.getString("AccountData")!)[0];
        context.read<LogInProvider>().state.loginModel = LoginModel.fromJson(userData);
        Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
      }
    });
  }
}