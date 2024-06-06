class QuestionAnswerPair {
  String question;
  int answer;

  QuestionAnswerPair({required this.question, required this.answer});

  fromJson(Map<String, dynamic> json) {
    return QuestionAnswerPair(
      question: json['question'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() => {
        'question': question,
        'answer': answer,
      };
}
