import 'dart:developer';

import 'package:background_experiment/contextExtension.dart';
import 'package:background_experiment/question.dart';
import 'package:background_experiment/questionNotifier.dart';
import 'package:flutter/material.dart';

class QuestionScale extends StatefulWidget {
  final Question question;
  final int answer;
  final int secondAnswer;
  final bool changeable;

  const QuestionScale({
    super.key,
    required this.question,
    this.answer = 0,
    this.secondAnswer = 0,
    required this.changeable,
  });

  @override
  _QuestionScaleState createState() => _QuestionScaleState();
}

enum ScalePositions {
  left,
  leftCenter,
  center,
  rightCenter,
  right,
}

class _QuestionScaleState extends State<QuestionScale> {
  String userID = '';

  bool y1 = false, y2 = false, y3 = false, y4 = false, y5 = false;
  bool x1 = false, x2 = false, x3 = false, x4 = false, x5 = false;

  void drawFirstAnswer(int answerNumber) {
    setState(() {
      x1 = answerNumber == 1;
      x2 = answerNumber == 2;
      x3 = answerNumber == 3;
      x4 = answerNumber == 4;
      x5 = answerNumber == 5;
    });
  }

  void drawSecondaryAnswer(int answerNumber) {
    setState(() {
      y1 = answerNumber == 1;
      y2 = answerNumber == 2;
      y3 = answerNumber == 3;
      y4 = answerNumber == 4;
      y5 = answerNumber == 5;
    });
  }

  void answerQuestion(int answerNumber) {
    drawFirstAnswer(answerNumber);
    if (answerNumber != 0) {
      Future.delayed(const Duration(milliseconds: 100), () {
        handleAnswer(answerNumber);
      });
    }
  }

  void handleAnswer(int answerNumber) {
    widget.question.answerValue = answerNumber;

    // find question In QuestionNotifier and replace that one with the modifued one containing the new answer
    QuestionNotifier().questions[QuestionNotifier()
        .questions
        .indexWhere((element) => element.questionID == widget.question.questionID)] = widget.question;
  }

  @override
  void initState() {
    super.initState();
    log("ANSWER: ${widget.answer}");
    log("SECOND ANSWER: ${widget.secondAnswer}");
    userID = "user!.uid";
    drawFirstAnswer(widget.answer);
    drawSecondaryAnswer(widget.secondAnswer);
  }

  double columnWidth(BuildContext context) => context.deviceWidth * 0.13;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10, color: Colors.black);

    return (Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildButton(ScalePositions.left, x1, y1),
            buildButton(ScalePositions.leftCenter, x2, y2),
            buildButton(ScalePositions.center, x3, y3),
            buildButton(ScalePositions.rightCenter, x4, y4),
            buildButton(ScalePositions.right, x5, y5),
          ],
        ),
        SizedBox(
          height: context.deviceHeight * 0.014,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildColumn(context, widget.question.isStatement, 'Nein', 'Stimme nicht zu', textStyle: textStyle),
            buildColumn(context, widget.question.isStatement, 'Eher Nein', '', textStyle: textStyle),
            buildColumn(context, widget.question.isStatement, 'Neutral', 'Neutral', textStyle: textStyle),
            buildColumn(context, widget.question.isStatement, 'Eher Ja', '', textStyle: textStyle),
            buildColumn(context, widget.question.isStatement, 'Ja', 'Stimme zu', textStyle: textStyle),
          ],
        ),
        const SizedBox(
          //Use of SizedBox
          height: 10,
        ),
      ],
    ));
  }

  // Helper function to create the buttons
  Widget buildButton(ScalePositions positions, bool x, bool y) {
    double buttonSize;
    double buttonWidth;
    double containerWidth;
    int answerNumber;

    switch (positions) {
      case ScalePositions.left:
        buttonSize = 0.13;
        buttonWidth = 0.13;
        containerWidth = 0.13;
        answerNumber = 1;
        break;
      case ScalePositions.leftCenter:
        buttonSize = 0.13;
        buttonWidth = 0.13;
        containerWidth = 0.1122;
        answerNumber = 2;
        break;
      case ScalePositions.center:
        buttonSize = 0.13;
        buttonWidth = 0.09;
        containerWidth = 0.0872;
        answerNumber = 3;
        break;
      case ScalePositions.rightCenter:
        buttonSize = 0.13;
        buttonWidth = 0.13;
        containerWidth = 0.1122;
        answerNumber = 4;
        break;
      case ScalePositions.right:
        buttonSize = 0.13;
        buttonWidth = 0.13;
        containerWidth = 0.13;
        answerNumber = 5;
        break;
    }

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: context.deviceWidth * buttonSize,
              width: context.deviceWidth * buttonWidth,
            ),
            SizedBox(
              width: context.deviceWidth * containerWidth,
              height: context.deviceWidth * containerWidth,
              child: OutlinedButton(
                onPressed: () => widget.changeable ? answerQuestion(answerNumber) : null,
                style: OutlinedButton.styleFrom(
                  shape: const CircleBorder(),
                  side: BorderSide(
                    width: 1.0,
                    color: y ? Theme.of(context).focusColor : Theme.of(context).colorScheme.secondary,
                  ),
                  backgroundColor: x ? Theme.of(context).focusColor : Theme.of(context).colorScheme.primaryContainer,
                ),
                child: const Text(''),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildColumn(BuildContext context, bool statement, String textFalse, String textTrue, {TextStyle? textStyle}) {
    final isVisible = !statement;
    const alignment = TextAlign.center;

    return SizedBox(
      width: columnWidth(context),
      child: Column(
        children: [
          Visibility(
            visible: isVisible,
            child: Text(textFalse, style: textStyle, textAlign: alignment),
          ),
          Visibility(
            visible: !isVisible,
            child: Text(textTrue, style: textStyle, textAlign: alignment),
          ),
        ],
      ),
    );
  }
}
