import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:posthub/components/alpha.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _postStream =
      FirebaseFirestore.instance.collection("posts").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _postStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Connection error occured");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading...");
            }

            var docs = snapshot.data!.docs;
            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) => Post(caption: docs[index]['caption'], imageUrl: docs[index]['imageUrl'], likes: "20"));
          }),
    );
  }
}
