import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emotion_icon/model/h_emoji.dart';

Future<List<h_Emoji>> getEmojisFromFirebase() async {
  final db = FirebaseFirestore.instance;

  var emojis = await db.collection('emojis').get();

  return emojis.docs.map((e) {
    var hEmoji = h_Emoji(
        e.data()['name'] ?? '', e.data()['id'] ?? 0,
        e.data()['code'] ?? '',
        e.reference.toString()
    );
    log(hEmoji.toString());
    return hEmoji;
  }).toList();
}

Future<void> addEmoji(String emojiName) async {
  var db = FirebaseFirestore.instance;

  var emoji = h_Emoji(emojiName, 0, '', '');

  await db.collection('emojis').add(emoji.toMap());
}
