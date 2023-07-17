import 'dart:developer';

import 'package:emotion_icon/utils/database_util.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class h_Emoji {
  final int id;
  final String name;

  const h_Emoji(this.name, this.id);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Emoji{id: $id, name: $name}';
  }
}

Future<void> insertEmoji(h_Emoji emoji) async {
  final db = await getEmojiDatabase();
  await db.insert(
    'EmotionIcon',
    emoji.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  db.close();
}

Future<void> updateDog(h_Emoji dog) async {
  // Get a reference to the database.
  final db = await getEmojiDatabase();

  // Update the given Dog.
  await db.update(
    'EmotionIcon',
    dog.toMap(),
    // Ensure that the Dog has a matching id.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [dog.id],
  );
}

// Get all emojis from database
Future<List<Emoji>> getAllEmojis() async {
  final db = await getEmojiDatabase();

  var parser = EmojiParser();

  final List<Map<String, dynamic>> maps = await db.query('EmotionIcon');

  db.close();

  var e = List.generate(maps.length, (i) {
    return parser.get(maps[i]['name']);
  });
  log(e.toString());

  // var e = <Emoji>[
  //   Emoji('coffee', '☕'),
  //   Emoji('heart', '❤️'),
  //   Emoji('party', '🎉'),
  //   Emoji('sun', '☀️'),
  //   Emoji('moon', '🌙'),
  //   Emoji('star', '⭐'),
  //   Emoji('cloud', '☁️'),
  // ];
  return Future.value(e);
}