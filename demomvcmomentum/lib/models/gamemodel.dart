import 'package:momentum/momentum.dart';
import '../controllers/gamecontronller.dart';

class GameModel extends MomentumModel<GameController> {
  final String word;

  const GameModel(super.controller, this.word);

  @override
  void update({String? word}) {
    GameModel(
      super.controller,
      word ?? this.word,
    ).updateMomentum();
  }

  String formatWord() {
    String formattedWord = '';
    for (int i = 0; i < word.length; i++) {
      formattedWord += '*';
    }
    return formattedWord;
  }
}
