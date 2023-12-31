import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:posthub/auth/auth.dart';
// import 'package:posthub/auth/auth.dart';
import 'package:posthub/firebase_options.dart';
import 'package:posthub/pages/home_page.dart';
import 'package:posthub/pages/profile.dart';
import 'package:posthub/pages/upload.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const AuthPage(),
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
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            gap: 8,
            onTabChange: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            backgroundColor: Colors.transparent,
            activeColor: Colors.orange,
            tabBackgroundColor: Colors.grey.shade900,
            tabActiveBorder: Border.all(
              width: 1,
            ),
            padding: const EdgeInsets.all(10),
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: "Feed",
              ),
              GButton(
                icon: Icons.camera_alt_outlined,
                text: "Post",
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
