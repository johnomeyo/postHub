import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Comment extends StatelessWidget {
  const Comment({super.key, required this.username, required this.text});
  final String username;
  final String text;
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
