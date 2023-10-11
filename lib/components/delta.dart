import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return   IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: SizedBox(
                                    height: 100,
                                    child: Column(
                                      children: [
                                        const Text(
                                            "Are you sure you want to log out?"),
                                        Row(
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("No")),
                                                TextButton(
                                                onPressed: ()async {
                                                   await FirebaseAuth.instance.signOut();
                                                },
                                                child: Text("Yes"))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      icon: const Icon(Icons.more_vert));
  }
}