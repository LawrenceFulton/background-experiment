import 'package:background_experiment/contextExtension.dart';
import 'package:background_experiment/question.dart';
import 'package:background_experiment/questionAnswerPair.dart';
import 'package:background_experiment/questionNotifier.dart';
import 'package:background_experiment/singleQuestion.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'creator.dart';

class OtherPerson extends StatefulWidget {
  final String chatIdentifier;
  final List<QuestionAnswerPair> otherPersonsAnswers;

  const OtherPerson({super.key, required this.chatIdentifier, required this.otherPersonsAnswers});

  @override
  _OtherPersonState createState() => _OtherPersonState();
}

class _OtherPersonState extends State<OtherPerson> with TickerProviderStateMixin {
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

  int getAnswer(String questionID) {
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

    return buildNewQuestions(context, questionNotifier.questions, creators);
  }

  Widget buildNewQuestions(BuildContext context, List<Question> questionItems, List<Creator> creators) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            controller: scrollController,
            children: [
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
                            changeable: false,
                            answer: getAnswer(questionItems[index].questionID),
                            statement: questionItems[index].isStatement,
                            secondAnswer: 0,
                          )),
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
            ],
          ),
        ));
  }
}
