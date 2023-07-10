import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class CreateUpdateEmojiPage extends StatefulWidget {
  const CreateUpdateEmojiPage({super.key, required this.mode, this.updateEmojiName = ''});

  final String mode;
  final String updateEmojiName;

  @override
  State<CreateUpdateEmojiPage> createState() => _CreateUpdateEmojiPageState();
}

class _CreateUpdateEmojiPageState extends State<CreateUpdateEmojiPage> {
  String emojiNameOrCode = '';
  late TextEditingController _textController;
  String notiText = '';

  var parser = EmojiParser();

  @override
  void initState() {
    _textController = TextEditingController();
    notiText = '';
    if (widget.mode == 'update') {
      _textController.text = widget.updateEmojiName;
    }
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mode == 'create' ? 'Create Emoji' : 'Update Emoji'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              widget.mode == 'create' ? 'Create Emoji' : 'Update Emoji',
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Agdasima',
              ),
            ),
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
