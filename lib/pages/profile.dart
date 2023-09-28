// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posthub/services/image_selection.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<String> images = [];
  String selectedPath = "";
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
                CircleAvatar(
                  radius: 50,
                  child: selectedPath == ""
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset("assets/dp.png"))
                      : Image.file(File(selectedPath)),
                ),
                 Align(
                  alignment: Alignment.bottomRight,
                   child: IconButton(
                    icon: const Icon(Icons.camera_alt_outlined),
                    onPressed:  () async {
                   await SelectImage().selectImageFromCamera();
                   if (selectedPath != "") {
                     Navigator.pop(context);
                     setState(() {});
                   } else {
                     ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(content: Text("No image selected")));
                   }
                    },
                     color: Colors.blue,
                   ),
                 ),
              ]),
              Text(
                "@astropphel",
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "4vr Lit😮‍💨🔥",
                style: GoogleFonts.lato(),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  height: 1,
                  color: Colors.grey.shade500,
                ),
              ),
              if (images.isNotEmpty)
                Expanded(
                  child: GridView.builder(
                      itemCount: images.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) => Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10)),
                          )),
                )
              else
                Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        "assets/oops.png",
                        height: 150,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Ooops!!! Seems you haven't posted yet😪",
                        style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
