import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app_v2/Data/Core/ApiRoutes.dart';
import 'package:story_app_v2/Data/Models/Login%20Model/LoginModel.dart';

class LoginService {
  Future<LoginModel> login(String mail, String password) async {
    Response response = await http.get(Uri.parse(ApiRoutes.loginUrl));
    var data = (json.decode(response.body))[0];
    log(data.toString());
    LoginModel loginModel = LoginModel.fromJson(data);
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString("AccountData", response.body);
    return loginModel;
  }
}