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
  static const Color focusColor = Color(0xFF1C4CDB);
  static const Color lightPrimaryContainer = Color(0xFFFFFFFF);

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

    // find question In QuestionNotifier and replace that one with the modified one containing the new answer

    int? indexOrNull =
        QuestionNotifier().premises.indexWhere((element) => element.questionID == widget.question.questionID);
    if (indexOrNull != -1) {
      QuestionNotifier().premises[indexOrNull] = widget.question;
    } else {
      QuestionNotifier().currentQuestion = widget.question;
    }
  }

  @override
  void initState() {
    super.initState();
    drawFirstAnswer(widget.answer);
    drawSecondaryAnswer(widget.secondAnswer);
  }

  double columnWidth(BuildContext context) => context.deviceWidth * 0.13;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 18, color: Colors.black);

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
        buildColumnRow(context, textStyle),
        const SizedBox(
          //Use of SizedBox
          height: 10,
        ),
      ],
    ));
  }

  Widget buildColumnRow(BuildContext context, TextStyle? textStyle) {
    return widget.question.alternativeScale == null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildColumn(context, widget.question.isStatement, 'Nein', 'Stimme nicht zu', 1,
                    textStyle: textStyle, isAlternativeScale: true),
                // buildColumn(context, widget.question.isStatement, '', ''),
                // Spacer(),
                // buildColumn(context, widget.question.isStatement, 'Neutral', 'Neutral', 3, textStyle: textStyle),
                // buildColumn(context, widget.question.isStatement, '', ''),
                // Spacer(),
                buildColumn(context, widget.question.isStatement, 'Ja', 'Stimme zu', 5,
                    textStyle: textStyle, isAlternativeScale: true),
              ],
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildColumn(context, widget.question.isStatement, widget.question.alternativeScale![0], '', 1,
                  isAlternativeScale: true),
              buildColumn(context, widget.question.isStatement, widget.question.alternativeScale![1], '', 5,
                  isAlternativeScale: true),
            ],
          );
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
            Container(
              width: context.deviceWidth * containerWidth,
              height: context.deviceWidth * containerWidth,
              decoration: (!widget.changeable && (x && y))
                  ? const BoxDecoration(
                      // add gradient color of container if widget non changeable and both answers are the same
                      // backgroundColor of OutlinedButton will be set to transparent so that gradient is visible
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        focusColor,
                        Color(0xff8ea7ed),
                      ]),
                    )
                  : null,
              child: OutlinedButton(
                onPressed: () => widget.changeable ? answerQuestion(answerNumber) : null,
                style: OutlinedButton.styleFrom(
                    shape: const CircleBorder(),
                    side: BorderSide(
                      width: 1.5,
                      color: Theme.of(context).colorScheme.secondary,
                      // color: Theme.of(context).colorScheme.secondary,
                    ),
                    backgroundColor: getBackgroundColor(x, y)),
                child: const Text(''),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // get backgroundColor of Button depending on first and second answer
  Color getBackgroundColor(bool x, bool y) {
    if (widget.changeable) {
      // if changeable version of question is created, initial y is set to
      // same value as x -> then return just color for x value
      return x ? focusColor : lightPrimaryContainer;
    }
    if (x && !y) {
      return focusColor;
    } else if (!x && y) {
      return const Color(0xff8ea7ed);
    } else if (x && y) {
      return Colors.transparent;
    } else {
      return lightPrimaryContainer;
    }
  }

  Widget buildColumn(BuildContext context, bool statement, String textFalse, String textTrue, int position,
      {TextStyle? textStyle, bool? isAlternativeScale}) {
    final isVisible = !statement;
    const alignment = TextAlign.center;

    if (isAlternativeScale == true) {
      return Text(textFalse, style: textStyle);
    }

    if (position == 0) {
      return Text(textFalse, style: textStyle, textAlign: TextAlign.start);
    }
    if (position == 4) {
      return Text(textFalse, style: textStyle, textAlign: TextAlign.end);
    }

    return Expanded(child: Text(textFalse, style: textStyle, textAlign: alignment));

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
