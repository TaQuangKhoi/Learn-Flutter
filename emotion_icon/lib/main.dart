import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:idb_sqflite/idb_sqflite.dart';

import 'package:emotion_icon/item_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'create_update_page.dart';

void main() async {
  var factory = databaseFactoryFfiWeb;

  var databasePath = await getDatabasesPath();

  var path = join(databasePath, 'emojis_database.db');

  var db = await factory.openDatabase(path);

  var sqliteVersion =
      (await db.rawQuery('select sqlite_version()')).first.values.first;
  print(sqliteVersion); // should print 3.39.3

  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  // WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  // final database = openDatabase(
  // Set the path to the database. Note: Using the `join` function from the
  // `path` package is best practice to ensure the path is correctly
  // constructed for each platform.
  //   join(await getDatabasesPath(), path),
  // );

  runApp(const MyApp());
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
