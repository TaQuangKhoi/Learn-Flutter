import 'package:flutter/material.dart';

class CreateUpdateEmojiPage extends StatefulWidget {
  const CreateUpdateEmojiPage({super.key});

  @override
  State<CreateUpdateEmojiPage> createState() => _CreateUpdateEmojiPageState();
}

class _CreateUpdateEmojiPageState extends State<CreateUpdateEmojiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create/Update Emoji'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Create/Update Emoji'),
            Container(
              margin: const EdgeInsets.all(10),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Emoji Name or Code',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
