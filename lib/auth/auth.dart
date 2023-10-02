import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
          if (snapshot.hasData) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const Home()));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const LoginPage();
        },
      ),
    );
  }
}
