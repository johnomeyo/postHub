import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final bool isSentByMe;
  final String text;
  final String time;

  const ChatBubble({
    super.key,
    required this.isSentByMe,
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSentByMe ? colorScheme.onSecondary : colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment:
                isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style:
                    themeData.textTheme.bodyLarge?.copyWith(color:isSentByMe? Colors.grey: Colors.grey.shade700),
              ),
              const SizedBox(height: 5),
              Text(
                time,
                style: themeData.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
