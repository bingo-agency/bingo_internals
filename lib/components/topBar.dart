import 'package:bingo_internals/AppState/appState.dart';
import 'package:bingo_internals/constants.dart';
import 'package:bingo_internals/screens/auth/loginScreen.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var appState = context.read<AppState>();
    return AppBar(
      // automaticallyImplyLeading: false,
      title: const Text("Internals"),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () async {
            await appState.logOutUser();

            checkLogin() async {
              await appState.checkAuth();
              if (appState.isLoggedIn == false) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen(),
                  ),
                );
              }
            }

            checkLogin();
          },
        ),
      ],
    );
  }
}
