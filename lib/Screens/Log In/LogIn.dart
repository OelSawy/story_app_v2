import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app_v2/Core/enums.dart';
import 'package:story_app_v2/Screens/Log%20In/Provider/logInProvider.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Logo.png",
              height: 250,
              width: 250,
            ),
            Consumer<LogInProvider>(
              builder: (context, provider, _) {
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade300),
                  child: Row(
                    children: [
                      const Icon(Icons.mail_outline_rounded, size: 35),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                            onChanged:
                                context.read<LogInProvider>().onMailChange,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Mail",
                                errorText: provider.state.mailErrorMessage),
                            controller: provider.state.mailController),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            Consumer<LogInProvider>(
              builder: (context, provider, _) {
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade300),
                  child: Row(
                    children: [
                      const Icon(Icons.account_circle_outlined, size: 35),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          onChanged:
                              context.read<LogInProvider>().onUsernnameChange,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              errorText: provider.state.passwordErrorMessage),
                          controller: provider.state.passwordController,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            InkWell(
              onTap: () => context.read<LogInProvider>().verify(context),
              child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 100, left: 100),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue),
                  child: const Text("Log In", style: TextStyle(fontSize: 25))),
            ),
            Consumer<LogInProvider>(
              builder: (context, provider, _) {
                return provider.state.status == ScreenStatus.loading
                    ? Container(
                        height: 100,
                        width: 100,
                        color: Colors.white,
                        child: const CircularProgressIndicator()
                      )
                    : const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
