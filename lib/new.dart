import 'dart:developer';

import 'package:background_experiment/question.dart';
import 'package:background_experiment/questionAnswerPair.dart';
import 'package:background_experiment/questionContainer.dart';
import 'package:background_experiment/questionNotifier.dart';
import 'package:background_experiment/userAnswerSender.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'creator.dart';

class NewQuestions extends StatefulWidget {
  const NewQuestions({super.key});

  @override
  _NewQuestionsState createState() => _NewQuestionsState();
}

class _NewQuestionsState extends State<NewQuestions> with TickerProviderStateMixin {
  final scrollController = ScrollController();
  final questionNotifier = QuestionNotifier();
  String chatIdentifier = '';
  final TextEditingController chatIdentifierController = TextEditingController();
  static const Color focusColor = Color(0xFF1C4CDB);
  bool isSubmitted = false;
  int ownUserID = -1;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Creator creators = Creator(
        creatorID: "",
        name: "",
        profilePicture: "",
        titlePicture: "",
        description: "",
        private: false,
        password: "",
        isVisible: true);

    return buildNewQuestions(context, questionNotifier.premises, creators);
  }

  void onPressed() async {
    if (isSubmitted) {
      final otherUserID = ownUserID == 0 ? 1 : 0;
      List<QuestionAnswerPair> questionAnswerPair =
          await UserAnswerSender().getUserAnswers(chatIdentifier, otherUserID.toString());

      if (questionAnswerPair.isNotEmpty) {
        Navigator.pushNamed(
          context,
          '/compare',
          arguments: {
            'chatIdentifier': chatIdentifier,
            'ownAnswers': questionNotifier.questionAnswerPairs,
            'otherPersonsAnswers': questionAnswerPair,
          },
        );
      } else {
        Navigator.pushNamed(
          context,
          '/waiting',
          arguments: {
            'chatIdentifier': chatIdentifier,
            'ownAnswers': questionNotifier.questionAnswerPairs,
            'otherPersonsUserID': otherUserID.toString(),
          },
        );
      }
      return;
    }

    if (chatIdentifier.isEmpty) {
      showToast(
        'Bitte geben Sie eine Chat Identifikation ein',
        position: ToastPosition.bottom,
        backgroundColor: Colors.red,
      );
      return;
    }

    Map<String, int> userAnswers = {};
    for (var question in questionNotifier.premises) {
      userAnswers[question.questionID] = question.answerValue;
    }
    userAnswers[questionNotifier.currentQuestion.questionID] = questionNotifier.currentQuestion.answerValue;

    ownUserID = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return FutureBuilder<int>(
          future:
              UserAnswerSender().addUserAnswer(userAnswers, chatIdentifier, questionNotifier.currentQuestion.headline),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const AlertDialog(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                  ],
                ),
              );
            } else {
              Navigator.pop(context, snapshot.data);
              return Container(); // Return an empty container
            }
          },
        );
      },
    );

    if (ownUserID == -1) {
      log("Error adding user answers, chat is full");
      return;
    }

    final otherUserID = ownUserID == 0 ? 1 : 0;

    List<QuestionAnswerPair> questionAnswerPair =
        await UserAnswerSender().getUserAnswers(chatIdentifier, otherUserID.toString());

    if (questionAnswerPair.isNotEmpty) {
      Navigator.pushNamed(
        context,
        '/compare',
        arguments: {
          'chatIdentifier': chatIdentifier,
          'ownAnswers': questionNotifier.questionAnswerPairs,
          'otherPersonsAnswers': questionAnswerPair,
        },
      );
    } else {
      Navigator.pushNamed(
        context,
        '/waiting',
        arguments: {
          'chatIdentifier': chatIdentifier,
          'ownAnswers': questionNotifier.questionAnswerPairs,
          'otherPersonsUserID': otherUserID.toString(),
        },
      );
    }

    isSubmitted = true;
  }

  Widget buildNewQuestions(BuildContext context, List<Question> questionItems, Creator creator) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: chatIdentifierController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fillColor: Colors.white,
                        labelText: 'Chat Identifikation',
                      ),
                      onChanged: (text) {
                        chatIdentifier = text;
                        chatIdentifier = chatIdentifier.trim();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: const Icon(Icons.info_outline),
                    onPressed: () {
                      showToast(
                        'Geben Sie eine eindeutige Chat-Identifikation ein. Ihr/e Partnerin muss die gleiche Identifikation eingeben, um die Fragen und Prämissen zu vergleichen.',
                        position: ToastPosition.bottom,
                        duration: const Duration(seconds: 5),
                        backgroundColor: focusColor,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                  child: ListView(
                controller: scrollController,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  QuestionContainer(
                    question: questionNotifier.currentQuestion,
                    creator: creator,
                  ),
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
                    itemCount: questionItems.length,
                    itemBuilder: (context, index) {
                      return QuestionContainer(
                        question: questionItems[index],
                        creator: creator,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        //Use of SizedBox
                        height: 15,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              )),
              Align(
                alignment: Alignment.centerRight,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: onPressed,
                    label: const Text('Abschicken'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
