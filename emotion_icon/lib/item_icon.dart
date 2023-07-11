import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

import 'create_update_page.dart';

class ItemIcon extends StatelessWidget {
  final int index;
  final Emoji emoji;
  final Function(String) removeEmoji;
  final Function(String) addEmoji;
  final Function(int, String) updateEmoji;

  const ItemIcon(
      {super.key,
      required this.emoji,
      required this.removeEmoji,
      required this.addEmoji,
      required this.updateEmoji,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                emoji.name,
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'Agdasima',
                ),
              ),
              Text(
                emoji.code,
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'Twemoji',
                ),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateUpdateEmojiPage(
                            mode: 'update',
                            emojiNameToUpdate: emoji.name,
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.edit)),
                ElevatedButton(
                    onPressed: () {
                      removeEmoji(emoji.name);
                    },
                    child: const Icon(Icons.delete)),
              ],
            )),
      ],
    );
  }
}
