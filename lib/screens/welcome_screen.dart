import 'package:flutter/material.dart';
import 'package:untitled1/screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/general_button.dart';
import 'chat_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  const WelcomeScreen({super.key});
  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = ColorTween(begin: Colors.white70, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });

    // Listen for authentication state changes
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        // User is logged in, navigate to the ChatScreen
        Navigator.pushReplacementNamed(context, ChatScreen.id);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _auth.authStateChanges().drain(); // Cancel the authStateChanges listener
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 100,
                    child: Image.asset('images/green_blue.png'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Converse',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 45.0,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 38.0,
            ),
            GeneralButton(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, LoginScreen.id);
                });
              },
              text: 'Log in',
              color: const Color(0xFF5D25DB),
            ),
            GeneralButton(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                });
              },
              text: 'Register',
              color: const Color(0xFF5D25DB),
            )
          ],
        ),
      ),
    );
  }
}
