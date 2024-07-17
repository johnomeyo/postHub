import 'package:flutter/material.dart';
import 'package:posthub/pages/messages/widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://static.vecteezy.com/system/resources/thumbnails/026/829/465/small_2x/beautiful-girl-with-autumn-leaves-photo.jpg",
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jordyn Dokidis'),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: const [
                ChatBubble(
                  text: 'Hai! Nice To Match U!',
                  isSentByMe: false,
                  time: '',
                ),
                ChatBubble(
                  text:
                      'Do you have anything fun planned for tomorrow afternoon?',
                  isSentByMe: false,
                  time: '',
                ),
                ChatBubble(
                  text:
                      'I\'m New in town and wanted to hang out with some locals for drinks and have a good time',
                  isSentByMe: false,
                  time: '',
                ),
                ChatBubble(
                  text: 'What should I call u?',
                  isSentByMe: true,
                  time: '',
                ),
                ChatBubble(
                  text: 'You can call me Asal',
                  isSentByMe: true,
                  time: '',
                ),
                ChatBubble(
                  text:
                      'Thats sounds good, I get off work around 6, pick you up at 7?',
                  isSentByMe: true,
                  time: '',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Send your message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
