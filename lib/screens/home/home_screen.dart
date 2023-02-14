import 'package:bingo_internals/AppState/appState.dart';
import 'package:bingo_internals/constants.dart';
import 'package:bingo_internals/screens/auth/loginScreen.dart';
import 'package:bingo_internals/screens/chats/chats_screen.dart';
import 'package:bingo_internals/screens/chats/components/body.dart';
import 'package:bingo_internals/screens/screenLayouts/responsive/desktopScaffold.dart';
import 'package:bingo_internals/screens/screenLayouts/responsive/mobileScaffold.dart';
import 'package:bingo_internals/screens/screenLayouts/responsive/tabletScaffold.dart';
import 'package:bingo_internals/screens/screenLayouts/responsiveLayout.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.read<AppState>();
    checkLogin() async {
      await appState.checkAuth();
      print('is logged in status => ' + appState.isLoggedIn.toString());
      if (appState.isLoggedIn == false) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen(),
          ),
        );
      }
    }

    checkLogin();

    return ResponsiveLayout(
      tabletScaffold: TabletScaffold(),
      desktopScaffold: DesktopScaffold(),
    );
  }
}
