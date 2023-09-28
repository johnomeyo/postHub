// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final descriptionController = TextEditingController();
  String selectedPath = "";
  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return "";
    }
  }

  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return "";
    }
  }

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
            selectedPath == ""
                ? Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade500),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(
                                    "Choose an image from...!!!",
                                    style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  content: SingleChildScrollView(
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            selectedPath =
                                                await selectImageFromGallery();
                                            if (selectedPath != "") {
                                              Navigator.pop(context);
                                              setState(() {});
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          "No image selected")));
                                            }
                                          },
                                          child: Card(
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  "assets/gallery.png",
                                                  height: 100,
                                                  width: 100,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  child: Text(
                                                    'Gallery',
                                                    style: GoogleFonts.lato(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            selectedPath =
                                                await selectImageFromCamera();
                                            if (selectedPath != "") {
                                              Navigator.pop(context);
                                              setState(() {});
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          "No image selected")));
                                            }
                                          },
                                          child: Card(
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  "assets/camera.png",
                                                  height: 100,
                                                  width: 100,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  child: Text(
                                                    'Camera',
                                                    style: GoogleFonts.lato(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                        child: const Icon(
                          Icons.file_upload_outlined,
                          size: 30,
                        ),
                      ),
                    ),
                  )
                : Image.file(
                    File(selectedPath),
                    height: 200,
                    width: double.infinity,
                  ),
            const SizedBox(
              height: 30,
            ),
            const Spacer(),
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
