import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class Comment extends StatefulWidget {
  const Comment({super.key});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final commentController = TextEditingController();

  void postComment() {}

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                    content: SizedBox(
                        height: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Comment:",
                              style: GoogleFonts.lato(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                            TextField(
                              controller: commentController,
                              decoration: InputDecoration(
                                hintText: "Say something...",
                                hintStyle: GoogleFonts.lato(),
                              ),
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel")),
                                const SizedBox(
                                  width: 10,
                                ),
                                TextButton(
                                    onPressed: () {
                                      if (commentController.text
                                          .trim()
                                          .isNotEmpty) {
                                        postComment();
                                      } else {
                                        Navigator.pop(context);
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                const AlertDialog(content: SizedBox(height:30,child: Text("The comment cannot be empty🙄")),));
                                      }
                                    },
                                    child: const Text("Post"))
                              ],
                            )
                          ],
                        )),
                  ));
        },
        icon: const Icon(Icons.comment));
  }
}
