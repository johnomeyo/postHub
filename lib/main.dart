import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:posthub/firebase_options.dart';
import 'package:posthub/pages/bookmarks.dart';
import 'package:posthub/pages/home/home_page.dart';
import 'package:posthub/pages/messages/messages.dart';
import 'package:posthub/pages/profile/profile.dart';
import 'package:posthub/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    ThemeData theme;
    if (brightness == Brightness.dark) {
      theme = MaterialTheme.darkTheme();
    } else {
      theme = MaterialTheme.lightTheme();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            selectedItemColor: colorScheme.secondary,
            unselectedItemColor: colorScheme.primary,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: "Chat"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_outline), label: "Bookmarks"),
              BottomNavigationBarItem(icon: Icon(Icons.person_3_outlined), label: "Profile"),
            ]),
        body: IndexedStack(
          index: index,
          children: const [HomePage(), Messages(), Bookmarks(), Profile()],
        ));
  }
}
