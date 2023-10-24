import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posthub/models/user_model.dart';

class Comment extends StatefulWidget {
  const Comment({super.key, required this.postID});
  final String postID;
  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final commentController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;

  void postComment(String postID, CommentModel comment) async {
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postID)
          .collection("comments")
          .add(comment.toJson());
    } catch (e) {
      // ignore: use_build_context_synchronously
      showBottomSheet(
          context: context,
          builder: ((context) =>
              SnackBar(content: Text("An error ${e.toString()} occured"))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser?.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data?.data() as Map<String, dynamic>;
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
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
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
                                                CommentModel comment =
                                                    CommentModel(
                                                        userID: userData[
                                                            'username'],
                                                        text: commentController
                                                            .text
                                                            .trim(),
                                                        timestamp:
                                                            DateTime.now());
                                                postComment(
                                                    widget.postID, comment);
                                                commentController.clear();
                                                Navigator.pop(context);
                                                showBottomSheet(
                                                    context: context,
                                                    builder: (context) =>
                                                        const SnackBar(
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
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
