import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:posthub/auth/sign_in.dart';
import 'package:posthub/main.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const Home();
            } else {
              return const LoginPage();
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
