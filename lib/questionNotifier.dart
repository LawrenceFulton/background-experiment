import 'package:background_experiment/question.dart';
import 'package:flutter/material.dart';

class QuestionNotifier with ChangeNotifier {
  static final QuestionNotifier _instance = QuestionNotifier._internal();

  factory QuestionNotifier() {
    return _instance;
  }

  QuestionNotifier._internal();

  List<Question> _questions = [];

  List<Question> get questions => _questions;

  set questions(List<Question> value) {
    _questions = value;
    notifyListeners();
  }
}
