import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class CreateUpdateEmojiPage extends StatefulWidget {
  const CreateUpdateEmojiPage({super.key, required this.mode, this.emojiNameToUpdate = ''});

  final String mode;
  final String emojiNameToUpdate;

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
      _textController.text = widget.emojiNameToUpdate;
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
              child: TextField(
                controller: _textController,
                onChanged: (text) {
                  if (text == '') {
                    setState(() {
                      notiText = '';
                    });
                    return;
                  }

                  setState(() {
                    if (parser.hasEmoji(text) || parser.hasName(text)) {
                      notiText = 'This is an emoji';
                      emojiNameOrCode = text;
                    } else {
                      notiText = 'This is not an emoji';
                    }
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Emoji Name or Code',
                ),
              ),
            ),
            Text(notiText),
            ElevatedButton(
                onPressed: () => {
                      if (widget.mode == 'create')
                        {Navigator.pop(context, emojiNameOrCode)}
                      else
                        {Navigator.pop(context, emojiNameOrCode)}
                    },
                child: const Text(
                  'Submit Text',
                  style: TextStyle(fontSize: 30),
                )),
          ],
        ),
      ),
    );
  }
}
