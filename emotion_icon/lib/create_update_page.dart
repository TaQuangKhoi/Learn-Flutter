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
      body: const Center(
        child: Text('Create/Update Emoji'),
      ),
    );
  }
}
