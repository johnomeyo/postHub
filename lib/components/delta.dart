import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posthub/models/user_model.dart';

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
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
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
  final String currentUserID = FirebaseAuth.instance.currentUser!.uid;

  void postComment(String postID, CommentModel comment) async {
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postID)
          .collection("comments")
          .add(comment.toJson());
    } catch (e) {
      print("The error is $e");
    }
  }

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
                            const SizedBox(
                              height: 20,
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
                                        CommentModel comment = CommentModel(
                                            userID: currentUserID,
                                            text: commentController.text.trim(),
                                            timestamp: DateTime.now());
                                        postComment(currentUserID, comment);
                                        commentController.clear();
                                        Navigator.pop(context);
                                        showBottomSheet(
                                            context: context,
                                            builder: (context) => const SnackBar(
                                                content: Text(
                                                    "Successfully commented✅")));
                                      } else {
                                        Navigator.pop(context);
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                const AlertDialog(
                                                  content: SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "The comment cannot be empty🙄")),
                                                ));
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
