import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import '../controllers/gamecontronller.dart';
import '../models/gamemodel.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Click button to get new word'),
          MomentumBuilder(
              builder: (context, snapshot) {
                var game = snapshot<GameModel>();
                return Text(
                  game.word,
                  style: const TextStyle(fontSize: 30),
                );
              },
              controllers: const [GameController]),
        ],
      ),
    );
  }
}
