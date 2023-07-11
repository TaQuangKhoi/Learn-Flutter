import 'package:emotion_icon/item_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'create_update_page.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  // WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  // final database = openDatabase(
  // Set the path to the database. Note: Using the `join` function from the
  // `path` package is best practice to ensure the path is correctly
  // constructed for each platform.
  //   join(await getDatabasesPath(), 'emojis_database.db'),
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

  void _updateEmoji(int idToUpdate, String emojiToUpdate) {
    setState(() {
      emojis[idToUpdate] = parser.getEmoji(emojiToUpdate);
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
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
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
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create');
        },
        tooltip: 'Add Emoji',
        child: const Icon(Icons.add),
      ),
    );
  }
}
