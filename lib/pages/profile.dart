import 'package:flutter/material.dart';

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
              const Text("@astropphel"),
              const SizedBox(
                height: 20,
              ),
              const Text("4vr Lit😮‍💨🔥"),
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
              Expanded(
                child: GridView.builder(
                    itemCount: images.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) => Container(
                          height: 100,
                          color: Colors.orange,
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
