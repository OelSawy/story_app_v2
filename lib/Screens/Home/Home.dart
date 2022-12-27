
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app_v2/Core/app_routes.dart';
import 'package:story_app_v2/Screens/Log%20In/Provider/logInProvider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      drawer: Drawer(
            backgroundColor: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 100),
                InkWell(
                  child: const SizedBox(height: 50, width: 200, child: Text("Contacts")),
                  onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.contacts, (route) => false),
                ),
                InkWell(
                  child: const SizedBox(height: 50, width: 200, child: Text("Stories")),
                  onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.story, (route) => false),
                ),
                IconButton(
                  onPressed: () => context.read<LogInProvider>().logOut(context),
                  icon: const Icon(Icons.logout, size: 50)
                )
              ],
            ),
          ),
      body: Center(child: Text("Welcome back ${context.read<LogInProvider>().state.loginModel!.username}", style: const TextStyle(fontSize: 25)))
    );
  }
}