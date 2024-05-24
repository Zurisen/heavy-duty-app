import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:trainingapp/services/auth.dart';
import 'package:trainingapp/widgets/login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FlutterLogo(size: 150),
            LoginButton(
              text: "Anonymous user", 
              icon: Ionicons.person, 
              color: Colors.grey, 
              loginMethod: AuthService().anonLogin
            ),
            LoginButton(
              text: "Sign in with Google",
              icon: Ionicons.logo_google, 
              color: Colors.blueAccent, 
              loginMethod: AuthService().googleLogin 
            ),
          ],
        ),
      ),
    );
  }
}