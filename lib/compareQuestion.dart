import 'dart:html' as html;

import 'package:background_experiment/contextExtension.dart';
import 'package:background_experiment/question.dart';
import 'package:background_experiment/questionAnswerPair.dart';
import 'package:background_experiment/questionNotifier.dart';
import 'package:background_experiment/singleQuestion.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'creator.dart';

class ComparePremises extends StatefulWidget {
  const ComparePremises();
  @override
  _ComparePremisesState createState() => _ComparePremisesState();
}

class _ComparePremisesState extends State<ComparePremises> with TickerProviderStateMixin {
  final scrollController = ScrollController();
  final questionNotifier = QuestionNotifier();
  late String chatIdentifier;
  late List<QuestionAnswerPair> ownAnswers;
  late List<QuestionAnswerPair> otherPersonsAnswers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      return;
    }
    final argsMap = args as Map;
    chatIdentifier = argsMap['chatIdentifier'];
    ownAnswers = argsMap['ownAnswers'];
    otherPersonsAnswers = argsMap['otherPersonsAnswers'];
  }

  @override
  void initState() {
    super.initState();
  }

  void scrollCallback() {
    scrollLogic();
  }

  int getOwnAnswer(String questionID) {
    final answer = ownAnswers.firstWhereOrNull((element) => element.question == questionID);
    if (answer != null) {
      return answer.answer;
    } else {
      return 0;
    }
  }

  int getOtherAnswer(String questionID) {
    final answer = otherPersonsAnswers.firstWhereOrNull((element) => element.question == questionID);
    if (answer != null) {
      return answer.answer;
    } else {
      return 0;
    }
  }

  void scrollLogic() {
    final double currentPosition = scrollController.position.pixels;
    const double scrollDownBy = 325; // height of a question
    final double targetPosition = currentPosition + scrollDownBy;
    scrollController.animateTo(
      targetPosition,
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Creator> creators = [
      const Creator(
          creatorID: "",
          name: "",
          profilePicture: "",
          titlePicture: "",
          description: "",
          private: false,
          password: "",
          isVisible: true)
    ];

    return buildNewQuestions(context, questionNotifier.premises, creators);
  }

  Widget buildNewQuestions(BuildContext context, List<Question> questionItems, List<Creator> creators) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            controller: scrollController,
            children: [
              const SizedBox(
                height: 15,
              ),
              singleQuestion(context, questionNotifier.currentQuestion, creators[0]),
              const SizedBox(
                height: 15,
              ),
              const Divider(),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: questionNotifier.premises.length,
                itemBuilder: (context, index) {
                  return singleQuestion(context, questionNotifier.premises[index], creators[0]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    //Use of SizedBox
                    height: 15,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  void openInWindow(String uri, String name) {
    html.window.open(uri, name);
  }

  Widget singleQuestion(BuildContext context, Question question, Creator creator) {
    return Container(
      //big container that holds everything, a block
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
                changeable: false,
                answer: getOwnAnswer(question.questionID),
                statement: question.isStatement,
                secondAnswer: getOtherAnswer(question.questionID),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
