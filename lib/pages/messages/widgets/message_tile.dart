import 'package:flutter/material.dart';
import 'package:posthub/pages/messages/chat_page.dart';

class MessageTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String message;
  final bool isNew;

  const MessageTile({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.message,
    this.isNew = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(
          name,
          style: themeData.textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          message,
          style: themeData.textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        trailing: isNew ? const Badge() : null,
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ChatPage())),
      ),
    );
  }
}
