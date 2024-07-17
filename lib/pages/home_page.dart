import 'package:flutter/material.dart';
import 'package:posthub/pages/home/post_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [colorScheme.secondary, colorScheme.surface])
                  
                  ),
          child: const SingleChildScrollView(
            child: Column(
              children: [
                Text("Welcome"),
                SizedBox(
                  height: 100,
                ),
                PostCard(),
                PostCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
