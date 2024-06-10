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
  final String chatIdentifier;
  final List<QuestionAnswerPair> ownAnswers;
  final List<QuestionAnswerPair> otherPersonsAnswers;

  const ComparePremises(
      {super.key, required this.chatIdentifier, required this.otherPersonsAnswers, required this.ownAnswers});

  @override
  _ComparePremisesState createState() => _ComparePremisesState();
}

class _ComparePremisesState extends State<ComparePremises> with TickerProviderStateMixin {
  final scrollController = ScrollController();
  final questionNotifier = QuestionNotifier();
  String chatIdentifier = '';
  String otherPersonsUserID = '';
  bool isOtherPersonVisible = false;

  @override
  void initState() {
    super.initState();
  }

  void scrollCallback() {
    scrollLogic();
  }

  int getOwnAnswer(String questionID) {
    final answer = widget.ownAnswers.firstWhereOrNull((element) => element.question == questionID);
    if (answer != null) {
      return answer.answer;
    } else {
      return 0;
    }
  }

  int getOtherAnswer(String questionID) {
    final answer = widget.otherPersonsAnswers.firstWhereOrNull((element) => element.question == questionID);
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
              const Divider(
                thickness: 4,
              ),
              const Text(
                "Nach Abschluss des Testes bitten wir Sie um Feedback.",
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      const url =
                          "https://docs.google.com/forms/d/e/1FAIpQLScbekEOVwGd5LeJgt47Aj0hkUt6723HOaTdowe0yrjbnXZ69g/viewform";
                      openInWindow(url, "Feedback");
                    },
                    label: const Text('Abschicken'),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
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
                answer: getOtherAnswer(question.questionID),
                statement: question.isStatement,
                secondAnswer: getOwnAnswer(question.questionID),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
