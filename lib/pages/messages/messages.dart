import 'package:flutter/material.dart';
import 'package:posthub/pages/messages/widgets/message_tile.dart';
import 'package:posthub/pages/messages/widgets/search_bar.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          CustomSearchBar(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Conversations (Recent)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          MessageTile(
            imageUrl:
                'https://static.vecteezy.com/system/resources/thumbnails/026/829/465/small_2x/beautiful-girl-with-autumn-leaves-photo.jpg',
            name: 'Jordyn Dokidis',
            message: 'Thats sounds good, I get off work around...',
            isNew: true,
          ),
          // Add more MessageTiles here
        ],
      ),
    );
  }
}
