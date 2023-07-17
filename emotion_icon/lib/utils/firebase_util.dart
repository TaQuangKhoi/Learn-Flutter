import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emotion_icon/model/h_emoji.dart';

Future<List<h_Emoji>> getEmojisFromFirebase() async {
  final db = FirebaseFirestore.instance;

  var emojis = await db.collection('emojis').get();

  // Log emojis
  emojis.docs.forEach((element) {
    log(element.data().toString());
  });

  return emojis.docs.map((e) {
    return h_Emoji(
        e.data()['name'] ?? '', e.data()['id'] ?? 0, e.data()['code'] ?? '');
  }).toList();
}

Future<void> addEmoji(h_Emoji emoji) async {
  var db = FirebaseFirestore.instance;

  await db.collection('emojis').add(emoji.toMap());
}
