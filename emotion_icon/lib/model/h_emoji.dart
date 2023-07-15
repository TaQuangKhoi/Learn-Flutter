import 'package:emotion_icon/utils/database_util.dart';
import 'package:sqflite/sqflite.dart';

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

  Future<void> insertEmoji(h_Emoji emoji, Database database) async {
    final db = getEmojiDatabase() as Database;
    await db.insert(
      'EmotionIcon',
      emoji.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    db.close();
  }
}