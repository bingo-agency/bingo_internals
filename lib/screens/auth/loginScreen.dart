import 'package:bingo_internals/AppState/appState.dart';
import 'package:bingo_internals/constants.dart';
import 'package:bingo_internals/screens/home/home_screen.dart';
import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    // emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var appState = context.read<AppState>();
    checkLogin() async {
      await appState.checkAuth();
      print('is logged in status => ' + appState.isLoggedIn.toString());
      if (appState.isLoggedIn == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen(),
          ),
        );
      }
    }

    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.read<AppState>();
    Size size = MediaQuery.of(context).size;
    bool _isChecked = false;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return phoneScreen();
          } else {
            return webScreen();
          }
        },
      ),
    );
  }

  Widget webScreen() {
    return Row(
      children: [
        Expanded(
            //<-- Expanded widget
            child: Image.asset(
          height: MediaQuery.of(context).size.height,
          // color: kPrimaryColor,
          'assets/images/heroImage.png',
          fit: BoxFit.cover,
        )),
        Expanded(
          //<-- Expanded widget
          child: Container(
            constraints: const BoxConstraints(maxWidth: 21),
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: formLayout(),
          ),
        ),
      ],
    );
  }

  Widget phoneScreen() {
    // return Container(
    //   child: Text('that?'),
    // );

    return formLayout();
  }

  formLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 200.0, left: 10.0),
          child: Image.asset(
            'assets/images/bingoLogo.png',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Welcome to Internals',
            style: GoogleFonts.inter(
              fontSize: 17,
              color: Colors.white70,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Login to your account',
            style: GoogleFonts.inter(
              fontSize: 23,
              color: Colors.white70,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 35),
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'dev@bingo-agency.com',
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
        const SizedBox(height: 25),
        TextButton(
          onPressed: () {
            //forgot password screen
          },
          child: const Text(
            'Forgot Password',
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 50,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
            ),
            child: const Text('Login'),
            onPressed: () async {
              var appState = await context.read<AppState>();
              print(emailController.text);
              print(passwordController.text);
              await appState.login(
                  context, emailController.text, passwordController.text);
              appState.checkAuth();
              checkLogin() async {
                await appState.checkAuth();
                if (appState.isLoggedIn == true) {
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
              //     builder: (BuildContext context) => LoginScreen(),
              //   ),
              // );
            },
          ),
        ),
      ],
    );
  }
}
