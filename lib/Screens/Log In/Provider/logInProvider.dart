
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app_v2/Core/Enums.dart';
import 'package:story_app_v2/Data/Services/Login%20Service/LoginService.dart';
import 'package:story_app_v2/Screens/Log%20In/Provider/logInState.dart';
import 'package:story_app_v2/Screens/Story/Provider/StoryProvider.dart';
import '../../../Core/app_routes.dart';
import 'package:email_validator/email_validator.dart';


class LogInProvider extends ChangeNotifier {
  LogInState state = LogInState();



  void verify(BuildContext context) async {
    state.status = ScreenStatus.loading;
    notifyListeners();
    state.loginModel = await LoginService().login(state.mail!, state.password!);
    if (state.loginModel != null) {
      state.status = ScreenStatus.done;
      notifyListeners();
      Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.story, (route) => false);
    } else {
      state.status = ScreenStatus.error;
      notifyListeners();
    }
  }

  void logOut(BuildContext context) async {
    state.mailController.text = state.loginModel!.mail.toString();
    state.loginModel = null;
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.clear();
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
  }

  void onMailChange(String value) {
    value.isEmpty ? state.mailErrorMessage = "You must enter a mail" : EmailValidator.validate(value) ? state.mailErrorMessage = null : state.mailErrorMessage = "Enter a valid mail";
    state.mail = value;
    notifyListeners();
  }

  void onUsernnameChange(String value) {
    value.isEmpty ? state.passwordErrorMessage = "You must enter a Username" : state.passwordErrorMessage = null;
    state.password = value;
    notifyListeners();
  }

  /* Future<void> getLoginDetails() async {
    Response response = await http.get(Uri.parse("$baseUrl/login"));
    if (response.statusCode == 200) {
      state.loginDetails = json.decode(response.body);
    }
  } */
}