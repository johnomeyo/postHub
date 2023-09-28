import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<String> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
              ),
              Text(
                "@astropphel",
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
               Text("4vr Lit😮‍💨🔥",style: GoogleFonts.lato(),),
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
                Column(
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
                )
            ],
          ),
        ),
      ),
    );
  }
}
