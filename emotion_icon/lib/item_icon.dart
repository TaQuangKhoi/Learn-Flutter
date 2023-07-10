import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class ItemIcon extends StatelessWidget {
  final Emoji emoji;
  final emojis;

  const ItemIcon({super.key, required this.emoji, this.emojis});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(emoji.name,
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'EmojiOne',
              ),
            ),
            Text(emoji.code,
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'EmojiOne',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(onPressed: () {}, child: const Icon(Icons.edit)),
            ElevatedButton(onPressed: () {
              emojis.remove(emoji);
            }, child: const Icon(Icons.delete)),
          ],
        ),
      ],
    );
  }
}

