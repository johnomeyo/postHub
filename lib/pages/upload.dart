import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create a post",
              style:
                  GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey.shade600,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey.shade500),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: descriptionController,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Write a post description",
                      hintStyle: GoogleFonts.lato()),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Upload a photo",
              style: GoogleFonts.lato(fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey.shade500),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(
                  Icons.file_upload_outlined,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Spacer(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Center(
                    child: Text(
                  "Post",
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold, letterSpacing: 1),
                )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
