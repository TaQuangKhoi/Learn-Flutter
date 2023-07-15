import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'package:emotion_icon/item_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'create_update_page.dart';
import 'model/h_emoji.dart';
import 'utils/database_util.dart';

void main() async {
  var factory = databaseFactoryFfiWeb;

  var path = 'emojis_database.db';

  var db = await factory.openDatabase(path);

  var sqliteVersion =
      (await db.rawQuery('select sqlite_version()')).first.values.first;
  print(sqliteVersion);


  // check if table is existed
  var isTableExisted = await db
      .rawQuery("SELECT * FROM sqlite_master WHERE name = 'EmotionIcon'");
  log(isTableExisted.toString());

  if (isTableExisted.isEmpty) {
    await db.execute('''
    CREATE TABLE EmotionIcon (
        id INTEGER PRIMARY KEY,
        name TEXT
    )
    ''');
  }

  db.close();

  // checkTable();

  runApp(const MyApp());
}

void checkTable() async {
  var db = getEmojiDatabase() as Database;

  var emoji1 = const h_Emoji('coffee');

  await emoji1.insertEmoji(emoji1, db);

  // query table
  var result = await db.query('EmotionIcon');

  log(result.toString());

  db.close();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/create': (context) => const CreateUpdateEmojiPage(mode: 'create'),
        '/update': (context) => const CreateUpdateEmojiPage(mode: 'update'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var emojis = <Emoji>[];
  var parser = EmojiParser();

  @override
  void initState() {
    emojis = <Emoji>[
      Emoji('coffee', '☕'),
      Emoji('heart', '❤️'),
      Emoji('party', '🎉'),
      Emoji('sun', '☀️'),
      Emoji('moon', '🌙'),
      Emoji('star', '⭐'),
      Emoji('cloud', '☁️'),
    ];
    super.initState();
  }

  void _deleteEmoji(String emojiToDelete) {
    setState(() {
      emojis.removeWhere((emoji) => emoji.name == emojiToDelete);
    });
  }

  void _addEmoji(String emojiToAdd) {
    setState(() {
      emojis.add(parser.getEmoji(emojiToAdd));
    });
  }

  void _updateEmoji(int idToUpdate, String newEmoji) {
    setState(() {
      emojis[idToUpdate] = parser.get(newEmoji);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
        margin: const EdgeInsets.all(6),
        child: ListView.builder(
            itemCount: emojis.length,
            itemBuilder: (context, index) {
              return ItemIcon(
                index: index,
                emoji: emojis[index],
                removeEmoji: _deleteEmoji,
                addEmoji: _addEmoji,
                updateEmoji: _updateEmoji,
              );
            }),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newEmoji = await Navigator.pushNamed(context, '/create');
          log(newEmoji.toString());
          if (newEmoji != null) {
            setState(() {
              emojis.add(parser.get(newEmoji.toString()));
            });
          }
        },
        tooltip: 'Add Emoji',
        child: const Icon(Icons.add),
      ),
    );
  }
}
