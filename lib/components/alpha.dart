// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posthub/components/delta.dart';

class Post extends StatefulWidget {
  Post(
      {super.key,
      required this.caption,
      required this.imageUrl,
      required this.likes,
      required this.currentPostID,
      required this.username});
  final String caption;
  final String imageUrl;
  final String currentPostID;
  final String username;
  List<String> likes;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final uploaderID = FirebaseFirestore.instance.collection("users").doc().id;

  bool isLiked = false;
  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser!.uid);
  }

  toggleIsLiked() {
    setState(() {
      isLiked = !isLiked;
    });
    DocumentReference postRef = FirebaseFirestore.instance
        .collection("posts")
        .doc(widget.currentPostID);
    if (isLiked) {
      postRef.update({
        'likes': FieldValue.arrayUnion([currentUser!.uid])
      });
    } else {
      postRef.update({
        'likes': FieldValue.arrayRemove([currentUser!.uid])
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade600,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.username,
                            style:
                                GoogleFonts.lato(fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.caption,
                        style: GoogleFonts.lato(fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(widget.imageUrl),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //like or comment section
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.likes.isEmpty
                                    ? ''
                                    : widget.likes.length.toString(),
                                style: GoogleFonts.lato(fontSize: 20),
                              ),
                              IconButton(
                                onPressed: toggleIsLiked,
                                icon: Icon(
                                  isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border_sharp,
                                  color: isLiked ? Colors.red : null,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Comment(
                            postID: widget.currentPostID,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
  }
}
