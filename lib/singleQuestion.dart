import 'package:background_experiment/contextExtension.dart';
import 'package:background_experiment/question.dart';
import 'package:background_experiment/questionScale.dart';
import 'package:background_experiment/questionText.dart';
import 'package:background_experiment/questionTitle.dart';
import 'package:flutter/material.dart';

import 'creator.dart';

class SingleQuestion extends StatefulWidget {
  final bool changeable;
  final int answer;
  final bool statement;
  final int secondAnswer;
  final Creator? creator;
  final Question question;
  final bool showInfoText;
  final bool disableBottomSheet;
  final bool disableSkipButton;

  const SingleQuestion({
    super.key,
    required this.question,
    this.changeable = true,
    this.disableBottomSheet = false,
    this.disableSkipButton = false,
    this.answer = 0,
    this.statement = false,
    this.secondAnswer = 0,
    this.showInfoText = true,
    this.creator,
  });

  @override
  _SingleQuestionState createState() => _SingleQuestionState();
}

class _SingleQuestionState extends State<SingleQuestion> {
  @override
  Widget build(BuildContext context) {
    return (Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      if (widget.question.headline != "") QuestionTitle(questionTitle: widget.question.headline),
      QuestionText(
        title: widget.question.text,
      ),
      SizedBox(
        //Use of SizedBox
        height: context.deviceHeight * 0.03,
      ),
      QuestionScale(
        question: widget.question,
        answer: widget.answer,
        secondAnswer: widget.secondAnswer,
        changeable: widget.changeable,
      ),
    ]));
  }
}
