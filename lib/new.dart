import 'package:background_experiment/contextExtension.dart';
import 'package:background_experiment/question.dart';
import 'package:background_experiment/questionNotifier.dart';
import 'package:background_experiment/singleQuestion.dart';
import 'package:background_experiment/userAnswerSender.dart';
import 'package:background_experiment/waitingPage.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'compareQuestion.dart';
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

  @override
  void initState() {
    super.initState();
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

  void onPressed() async {
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

    showDialog(
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
    ).then((ownUserID) {
      if (ownUserID == -1) {
        return;
      }

      final otherUserID = ownUserID == 0 ? 1 : 0;

      UserAnswerSender().getUserAnswers(chatIdentifier, otherUserID.toString()).then((value) {
        if (value.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ComparePremises(
                chatIdentifier: chatIdentifier,
                ownAnswers: questionNotifier.questionAnswerPairs,
                otherPersonsAnswers: value,
              ),
            ),
          );
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WaitingPage(
                      chatIdentifier: chatIdentifier,
                      ownAnswers: questionNotifier.questionAnswerPairs,
                      otherPersonsUserID: otherUserID.toString())));
        }
      });
    });
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
              //Text input field to add a chat identifier
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: Colors.white,
                  labelText: 'Chat Identifikation',
                ),
                onChanged: (text) {
                  chatIdentifier = text;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              questionContainer(context, questionNotifier.currentQuestion, creators[0]),
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
                  return questionContainer(context, questionItems[index], creators[0]);
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
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ));
  }

  Widget questionContainer(BuildContext context, Question question, Creator creator) {
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
                changeable: true,
                answer: 0,
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
