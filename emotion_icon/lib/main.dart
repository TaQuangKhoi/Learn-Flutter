import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/firebase_util.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import '../item_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

import 'create_update_page.dart';
import 'model/h_emoji.dart';
import 'utils/database_util.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // var db = FirebaseFirestore.instance;

  // Create a new user with a first and last name
  // final user = <String, dynamic>{
  //   "first": "Ada",
  //   "last": "Lovelace",
  //   "born": 1815
  // };

  // Add a new document with a generated ID
  // db.collection("users").add(user).then((DocumentReference doc) =>
  //     print('DocumentSnapshot added with ID: ${doc.id}'));

  runApp(const MyApp());
}

void createTable () async {
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
}

void checkTable() async {
  var db = await getEmojiDatabase();

  // var emoji1 = const h_Emoji('coffee');

  // await insertEmoji(emoji1);

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
    emojis = <Emoji>[];

    // emojis = getAllEmojis() as List<Emoji>;
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

  void getEmojis() async {
    var e = await getAllEmojis();
    setState(() {
      emojis = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    log('build');

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
        child: FutureBuilder<List<h_Emoji>>(
          future: getEmojisFromFirebase(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ItemIcon(
                      index: index,
                      removeEmoji: _deleteEmoji,
                      addEmoji: _addEmoji,
                      updateEmoji: _updateEmoji,
                      hEmoji: snapshot.data![index],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newEmojiName = await Navigator.pushNamed(context, '/create');
          log(newEmojiName.toString());
          if (newEmojiName != null) {
            await addEmoji(newEmojiName.toString());
          }
        },
        tooltip: 'Add Emoji',
        child: const Icon(Icons.add),
      ),
    );
  }
}
