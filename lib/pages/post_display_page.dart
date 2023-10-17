import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posthub/components/epslon.dart';
// import 'package:posthub/components/epslon.dart';

class PostDisplayPage extends StatefulWidget {
  const PostDisplayPage(
      {super.key, required this.imageUrl, required this.postID});
  final String imageUrl;
  final String postID;

  @override
  State<PostDisplayPage> createState() => _PostDisplayPageState();
}

class _PostDisplayPageState extends State<PostDisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(widget.imageUrl), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 10,
                left: 0,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_sharp),
                ),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Comments: ",
              style: GoogleFonts.aBeeZee(
                  fontSize: 20, fontWeight: FontWeight.w900),
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('posts')
                    .doc(widget.postID)
                    .collection('comments')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  var comments = snapshot.data!.docs;
                  print("COMMENTS ARE ${comments.length}");
                  return Expanded(
                    child: ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (context, index) => Comment(
                              username: comments[index]['userID'],
                              text: comments[index]['text'],
                            )),
                  );
                })
          ],
        ),
      ),
    ));
  }
}
