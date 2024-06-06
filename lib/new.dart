import 'package:background_experiment/contextExtension.dart';
import 'package:background_experiment/question.dart';
import 'package:background_experiment/questionNotifier.dart';
import 'package:background_experiment/singleQuestion.dart';
import 'package:background_experiment/userAnswerSender.dart';
import 'package:background_experiment/waitingPage.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'creator.dart';
import 'otherPerson.dart';

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

    return buildNewQuestions(context, questionNotifier.questions, creators);
  }

  String answerValues(List<Question> questions) => questions.map((e) => e.answerValue).toList().toString();

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
    for (var question in questionNotifier.questions) {
      userAnswers[question.questionID] = question.answerValue;
    }
    final ownUserID = await UserAnswerSender().addUserAnswer(userAnswers, chatIdentifier);
    final otherUserID = ownUserID == 0 ? 1 : 0;

    UserAnswerSender().getUserAnswers(chatIdentifier, otherUserID.toString()).then((value) {
      if (value.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtherPerson(
              chatIdentifier: chatIdentifier,
              otherPersonsAnswers: value,
            ),
          ),
        );
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WaitingPage(chatIdentifier: chatIdentifier, otherPersonsUserID: otherUserID.toString())));
      }
    });
  }

  Widget buildNewQuestions(BuildContext context, List<Question> questionItems, List<Creator> creators) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Chat Identifikation',
                ),
                onChanged: (text) {
                  chatIdentifier = text;
                },
              ),
              const SizedBox(
                height: 15,
              ),

              ListView.separated(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: questionItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    //big container that holds everything, a block
                    width: context.deviceWidth * 0.1,

                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: SingleQuestion(
                              question: questionItems[index],
                              creator: creators[0],
                              changeable: true,
                              answer: 0,
                              statement: questionItems[index].isStatement,
                              secondAnswer: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: onPressed,
                  child: const Text('Abschicken'),
                ),
              ),
              Text(answerValues(questionItems)),
            ],
          ),
        ));
  }
}
