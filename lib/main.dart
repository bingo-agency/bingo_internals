import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '/screens/splash/splash_screen.dart';
import '/theme.dart';
import 'package:flutter/material.dart';

import 'AppState/appState.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBV8_20LXZ78U5AD6vwcXZkGEqtXrxab3g",
      authDomain: "bingo-internals.firebaseapp.com",
      projectId: "bingo-internals",
      storageBucket: "bingo-internals.appspot.com",
      messagingSenderId: "58331623878",
      appId: "1:58331623878:web:bb308b5d3c3c274d9402c7",
      measurementId: "G-WD7CS2N3KH",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AppState(),
        ),
      ],
      child: MaterialApp(
        title: 'Internals',
        debugShowCheckedModeBanner: false,
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        home: const SplashScreen(),
      ),
    );
  }
}
