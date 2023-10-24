import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posthub/components/epslon.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void editField(String field) async {
    String newValue = "";
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Edit $field"),
              content: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Enter the new $field",
                ),
                onChanged: (value) => newValue = value,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(newValue);
                    },
                    child: const Text("Save"))
              ],
            ));
    if (newValue.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.email)
          .update({field: newValue});
    }
  }

  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser.email)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          final userData = snapshot.data!.data() as Map<String, dynamic>;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                      child: Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 120,
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "My details",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  MyTextBox(
                      text: userData['username'],
                      sectionName: "username",
                      onPressed: () => editField('username')),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextBox(
                      text: userData['bio'],
                      sectionName: "bio",
                      onPressed: () => editField('bio'))
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("An error ${snapshot.error.toString()} occured");
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ),
        );
      },
    ));
  }
}
