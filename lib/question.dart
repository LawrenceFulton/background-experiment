class Question {
  final String questionID;
  final String text;
  final String headline;
  final bool isStatement;
  final String creatorID;
  final bool wasEdited;
  final String userID;
  int answerValue;
  final List<String>? alternativeScale;

  Question({
    required this.questionID,
    required this.text,
    required this.headline,
    required this.isStatement,
    required this.creatorID,
    required this.wasEdited,
    required this.userID,
    this.alternativeScale,
    this.answerValue = 0,
  });

  @override
  String toString() {
    return 'Question{questionID: $questionID, text: $text, headline: $headline, isStatement: $isStatement, creatorID: $creatorID, wasEdited: $wasEdited, userID: $userID, answerValue: $answerValue, alternativeScale: $alternativeScale}';
  }
}
