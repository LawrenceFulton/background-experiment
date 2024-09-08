import 'package:background_experiment/question.dart';
import 'package:background_experiment/questionAnswerPair.dart';
import 'package:flutter/material.dart';

class QuestionNotifier with ChangeNotifier {
  static final QuestionNotifier _instance = QuestionNotifier._internal();

  factory QuestionNotifier() {
    return _instance;
  }

  QuestionNotifier._internal();

  late Question _currentQuestion;

  Question get currentQuestion => _currentQuestion;

  set currentQuestion(Question value) {
    _currentQuestion = value;
    notifyListeners();
  }

  List<Question> _premises = [];
  List<Question> get premises => _premises;
  set premises(List<Question> value) {
    _premises = value;
    notifyListeners();
  }

  List<QuestionAnswerPair> get questionAnswerPairs {
    final List<QuestionAnswerPair> pairs = [];
    for (Question question in _premises) {
      pairs.add(QuestionAnswerPair(question: question.questionID, answer: question.answerValue));
    }
    pairs.add(QuestionAnswerPair(question: _currentQuestion.questionID, answer: _currentQuestion.answerValue));
    return pairs;
  }
}
