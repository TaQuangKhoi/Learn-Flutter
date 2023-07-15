import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

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
    final db = await database;
    await db.insert(
      'EmotionIcon',
      emoji.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}