import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class ItemIcon extends StatelessWidget {
  final Emoji emoji;
  final emojis;

  const ItemIcon({super.key, required this.emoji, this.emojis});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(emoji.code),
        Text(emoji.name),
        ElevatedButton(onPressed: () {}, child: const Icon(Icons.edit)),
        ElevatedButton(onPressed: () {}, child: const Icon(Icons.delete)),
      ],
    );
  }
}

