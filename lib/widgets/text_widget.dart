import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final bool isMe;
  final String text;

  const TextWidget({
    super.key,
    required this.isMe,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 2,
        color: isMe ? Colors.blueAccent : Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            child: SelectableText(
              text,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
