import 'package:flutter/material.dart';
import 'package:posthub/pages/profile/profile_section.dart';
import 'package:posthub/pages/profile/profile_textfield.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR71cxgV5TA52Su_QmxSKyk2eYaQ17Sfzn65g&s',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, color: Colors.white),
                        onPressed: () {
                          // Add your onPressed code here!
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text("Details"),
            const SizedBox(
              height: 20,
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ProfileTextField(
                      label: 'Name',
                      initialValue: 'Melissa Peters',
                    ),
                    ProfileTextField(
                      label: 'Email',
                      initialValue: 'melpeters@gmail.com',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Others"),
            const SizedBox(
              height: 20,
            ),
            const ProfileSection()
          ],
        ),
      ),
    );
  }
}
