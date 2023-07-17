import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emotion_icon/model/h_emoji.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

Future<List<h_Emoji>> getEmojisFromFirebase() async {
  var db = FirebaseFirestore.instance;

  var emojis = await db.collection('emojis').get();

  return emojis.docs.map((e) {
    return h_Emoji(e.data()['name'], e.data()['id'], e.data()['code']);
  }).toList();
}