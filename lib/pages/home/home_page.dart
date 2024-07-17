import 'package:flutter/material.dart';
import 'package:posthub/pages/home/post_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = [
      const PostCard(
        imageUrl:
            "https://static.vecteezy.com/system/resources/thumbnails/026/829/465/small_2x/beautiful-girl-with-autumn-leaves-photo.jpg",
        username: 'flares',
      ),
      const PostCard(
        imageUrl:
            "https://images.unsplash.com/photo-1615752592676-f6bd84f9419d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        username: 'astropphel',
      )
    ];
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
                    colors: [colorScheme.secondary, colorScheme.surface])),
            child: Expanded(
              child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return posts[index];
                  }),
            )),
      ),
    );
  }
}
