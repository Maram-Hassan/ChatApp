import 'package:chat_app/models/messagemodel.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
class chatbubble extends StatelessWidget {
   chatbubble({super.key, required this.message});
   Messages message;

  @override
  Widget build(BuildContext context) {
            return BubbleSpecialOne(
              text:message.message,
              isSender: false,
              color: Colors.purple.shade100,
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.purple,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            );
  }
}
