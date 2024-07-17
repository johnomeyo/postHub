import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:posthub/firebase_options.dart';
import 'package:posthub/pages/home_page.dart';
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
      home: const HomePage(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hey"),
      ),
      body: Column(
        children: [
          Badge(
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.notifications)),
          ),
          Center(
            child: FilledButton(onPressed: () {}, child: const Text("Wasssup")),
          ),
        ],
      ),
    );
  }
}
