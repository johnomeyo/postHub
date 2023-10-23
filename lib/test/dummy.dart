import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final user = FirebaseAuth.instance.currentUser;

Future<Map<String, dynamic>> getUserData(String uid) async {
  final userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
  return userDoc.data() as Map<String, dynamic>;
}


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserData(user!.email!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Loading indicator
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final userData = snapshot.data as Map<String, dynamic>;
            return Scaffold(
              body: Column(
                children: <Widget>[
                  Text('Username: ${userData['username']}'),
                  // Add more widgets to display other user data
                ],
              ),
            );
          }
        }
      },
    );
  }
}
