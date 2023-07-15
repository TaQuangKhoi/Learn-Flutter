import 'dart:developer';

import 'package:emotion_icon/utils/database_util.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class h_Emoji {
  final String name;

  const h_Emoji(this.name);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Emoji{name: $name}';
  }
}

Future<void> insertEmoji(h_Emoji emoji) async {
  final db = getEmojiDatabase() as Database;
  await db.insert(
    'EmotionIcon',
    emoji.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  db.close();
}

// Get all emojis from database
Future<List<Emoji>> getAllEmojis() async {
  final db = await getEmojiDatabase();

  var parser = EmojiParser();

  final List<Map<String, dynamic>> maps = await db.query('EmotionIcon');
  log("maps.toString()" + maps.toString());

  db.close();

  // return List.generate(maps.length, (i) {
  //   return parser.get(maps[i]['name']);
  // });

  var e = <Emoji>[
    Emoji('coffee', '☕'),
    Emoji('heart', '❤️'),
    Emoji('party', '🎉'),
    Emoji('sun', '☀️'),
    Emoji('moon', '🌙'),
    Emoji('star', '⭐'),
    Emoji('cloud', '☁️'),
  ];
  return Future.value(e);
}