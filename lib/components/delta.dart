import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                    contentPadding: const EdgeInsets.all(0),
                    content: SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("Are you sure you want to log out?"),
                          Row(
                            children: [
                              const Spacer(),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("No")),
                              TextButton(
                                  onPressed: () async {
                                    await FirebaseAuth.instance.signOut();
                                  },
                                  child: const Text("Yes"))
                            ],
                          )
                        ],
                      ),
                    ),
                  ));
        },
        icon: const Icon(
          Icons.more_vert,
        ));
  }
}
