class Question {
  String questionText = '';
  String imageUrl = '';
  String answer1 = '';
  String answer2 = '';
  String answer3 = '';
  String answer4 = '';

  int rightAnswer = 0;

  Question(
      {required String q,
      required String i,
      required String a,
      required String b,
      required String c,
      required String d,
      required int r}) {
    questionText = q;
    imageUrl = i;
    answer1 = a;
    answer2 = b;
    answer3 = c;
    answer4 = d;
    rightAnswer = r;
  }
}
