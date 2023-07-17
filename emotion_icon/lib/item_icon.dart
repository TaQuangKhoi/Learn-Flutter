import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

import 'create_update_page.dart';
import 'model/h_emoji.dart';

class ItemIcon extends StatelessWidget {
  final int index;
  final h_Emoji hEmoji;
  final Function(String) removeEmoji;
  final Function(String) addEmoji;
  final Function(int, String) updateEmoji;

  const ItemIcon(
      {super.key,
      required this.removeEmoji,
      required this.addEmoji,
      required this.updateEmoji,
      required this.index, required this.hEmoji});

  void update(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateUpdateEmojiPage(
          mode: 'update',
          emojiNameToUpdate: hEmoji.name,
        ),
      ),
    );

    log('result: $result');

    updateEmoji(index, result[0]);
  }

  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    var emoji = parser.getEmoji(hEmoji.name);

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
                    onPressed: () => update(context),
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
