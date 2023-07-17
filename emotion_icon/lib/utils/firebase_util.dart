import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

Future<List<Emoji>> getEmojisFromFirebase() async {
  var db = FirebaseFirestore.instance;

  var emojis = await db.collection('emojis').get();

  // TODO: Return emojis with Emoji type
  var parser = EmojiParser();

  return emojis.docs.map((e) {
    return parser.get(e.data()['name']);
  }).toList();
}