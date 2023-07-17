import 'package:momentum/momentum.dart';
import '../models/gamemodel.dart';

class GameController extends MomentumController<GameModel> {
  final listOfWords = ['swift', 'android', 'flutter'];
  int wordIndex = 0;

  @override
  GameModel init() {
    return GameModel(
      this,
      listOfWords[wordIndex],
    );
  }

  void nextWord() {
    wordIndex++;
    if (wordIndex >= listOfWords.length) {
      wordIndex = 0;
    }
    model.update(word: listOfWords[wordIndex]);
  }
}
