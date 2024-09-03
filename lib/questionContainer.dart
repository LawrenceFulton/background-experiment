import 'package:background_experiment/contextExtension.dart';
import 'package:background_experiment/question.dart';
import 'package:background_experiment/questionNotifier.dart';
import 'package:background_experiment/singleQuestion.dart';
import 'package:flutter/material.dart';

import 'creator.dart';

class QuestionContainer extends StatelessWidget {
  final Question question;
  final Creator creator;

  const QuestionContainer({
    super.key,
    required this.question,
    required this.creator,
  });

  int _getOwnAnswer(String questionID) {
    final int indexOrNull =
        QuestionNotifier().premises.indexWhere((element) => element.questionID == question.questionID);

    if (indexOrNull != -1) {
      return QuestionNotifier().premises[indexOrNull].answerValue;
    } else {
      return QuestionNotifier().currentQuestion.answerValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.deviceWidth * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Column(
          children: [
            ListTile(
              title: SingleQuestion(
                question: question,
                creator: creator,
                changeable: true,
                answer: _getOwnAnswer(question.questionID),
                statement: question.isStatement,
                secondAnswer: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
