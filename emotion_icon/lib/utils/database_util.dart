import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

Future<Database> getEmojiDatabase () async {
  var factory = databaseFactoryFfiWeb;

  var path = 'emojis_database.db';

  var db = await factory.openDatabase(path);

  return db;
}