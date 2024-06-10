class Question {
  final String questionID;
  final String text;
  final String headline;
  final bool isStatement;
  final String creatorID;
  final bool wasEdited;
  final String userID;
  int _answerValue;
  final List<String>? alternativeScale;

  int get answerValue => _answerValue;

  Question({
    required this.questionID,
    required this.text,
    required this.headline,
    required this.isStatement,
    required this.creatorID,
    required this.wasEdited,
    required this.userID,
    this.alternativeScale,
  }) : _answerValue = 0;

  set answerValue(int value) {
    _answerValue = value;
  }
}
