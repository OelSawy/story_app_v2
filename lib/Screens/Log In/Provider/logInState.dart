import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:story_app_v2/Core/Enums.dart';
import 'package:story_app_v2/Data/Core/Url.dart';
import 'package:story_app_v2/Data/Models/Login%20Model/LoginModel.dart';


class LogInState {
  String? mail;
  String? password;
  String? mailErrorMessage;
  String? passwordErrorMessage;
  TextEditingController mailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  LoginModel? loginModel;
  ScreenStatus status = ScreenStatus.init;
  String? correctUsername;
  String? correctMail;

  LogInState() {
    getLoginDetails();
  }
  
  void getLoginDetails() async {
    Response response = await http.get(Uri.parse("$baseUrl/login"));
    List<dynamic> temp = json.decode(response.body);
    correctUsername = temp[0]["username"];
    correctMail = temp[0]["email"];
  }
}