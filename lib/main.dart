import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:posthub/pages/home_page.dart';
import 'package:posthub/pages/profile.dart';
import 'package:posthub/pages/upload.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  final List<Widget> pages = [
    const HomePage(),
    const Upload(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: GNav(
            gap: 8,
            onTabChange: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            backgroundColor: Colors.transparent,
            color: Colors.white,
            activeColor: Colors.white,
            // textStyle: GoogleFonts.lato(),

            tabs: const [
              GButton(
                icon: Icons.dashboard,
                text: "Feed",
              ),
              GButton(
                icon: Icons.add,
                text: "Upload",
              ),
              GButton(
                icon: Icons.person_2_outlined,
                text: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
