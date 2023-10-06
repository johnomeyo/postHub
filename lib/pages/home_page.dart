import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posthub/auth/sign_in.dart';
import 'package:posthub/components/alpha.dart';
import 'package:posthub/test/dummy.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "";
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
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const MyWidget())));
                      },
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Post",
                                style: GoogleFonts.lato(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Text(
                                    "Hub",
                                    style: GoogleFonts.lato(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                },
                                icon: const Icon(Icons.person_2_outlined)),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: docs.length,
                          itemBuilder: (context, index) => Post(
                              caption: docs[index]['caption'],
                              imageUrl: docs[index]['imageUrl'],
                              likes: 20)),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
