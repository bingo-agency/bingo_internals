import 'dart:async';

import 'package:bingo_internals/AppState/appState.dart';
import 'package:bingo_internals/screens/auth/loginScreen.dart';
import 'package:bingo_internals/screens/chats/chats_screen.dart';
import 'package:bingo_internals/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.read<AppState>();

    Timer(const Duration(seconds: 2), () {
      checkLogin() async {
        await appState.checkAuth();
        print('is logged in status => ' + appState.isLoggedIn.toString());
        if (appState.isLoggedIn == false) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen(),
            ),
          );
        }
      }

      checkLogin();
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     // builder: (BuildContext context) => ChatsScreen(),
      //     builder: (BuildContext context) => HomeScreen(),
      //   ),
      // );
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          MediaQuery.of(context).platformBrightness == Brightness.light
              ? "assets/images/Logo_light.png"
              : "assets/images/Logo_dark.png",
          width: MediaQuery.of(context).size.width / 3,
        ),
      ),
    );
  }
}
