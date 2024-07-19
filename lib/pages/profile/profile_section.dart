import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text("Edit your profile"),
          ),
          ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text("Notifications"),
          ),
          ListTile(
            leading: Icon(Icons.flag_outlined),
            title: Text("Report a problem"),
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text("Log out"),
          ),
        ],
      ),
    );
  }
}
