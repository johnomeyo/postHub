import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Comment extends StatelessWidget {
  const Comment({super.key, required this.text, required this.username});
  final String text;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            username,
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold, color: Colors.grey.shade500),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(text,
                style: GoogleFonts.lato(color: Colors.grey.shade500)),
          )
        ],
      ),
    );
  }
}

class MyTextFields extends StatelessWidget {
  const MyTextFields(
      {super.key, required this.hintText, required this.controller});
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          style: TextStyle(color: Colors.grey.shade500),
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade700),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyTextBox extends StatelessWidget {
   MyTextBox({super.key, required this.text, required this.sectionName, required this.onPressed});
  final String text;
  final String sectionName;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    sectionName,
                    style: GoogleFonts.aBeeZee(color: Colors.grey.shade400),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        color: Colors.grey.shade400,
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: GoogleFonts.aBeeZee(color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
