import 'package:background_experiment/contextExtension.dart';
import 'package:background_experiment/questionAnswerPair.dart';
import 'package:background_experiment/userAnswerSender.dart';
import 'package:flutter/material.dart';

import 'compareQuestion.dart';

class WaitingPage extends StatefulWidget {
  final String chatIdentifier;
  final List<QuestionAnswerPair> ownAnswers;
  final String otherPersonsUserID;

  const WaitingPage(
      {super.key, required this.chatIdentifier, required this.otherPersonsUserID, required this.ownAnswers});

  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  @override
  void initState() {
    super.initState();
    subscribeToAnswers();
  }

  void subscribeToAnswers() {
    UserAnswerSender().getUserAnswersStream(widget.chatIdentifier, widget.otherPersonsUserID).listen((value) {
      if (value.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ComparePremises(
              ownAnswers: widget.ownAnswers,
              chatIdentifier: widget.chatIdentifier,
              otherPersonsAnswers: value,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            //add image from Assets
            SizedBox(
              width: context.deviceWidth * 0.5,
              child: ClipRect(
                child: Image.asset(
                  'assets/img.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Warte auf Antwort von Ihrer/m GesprächspartnerIn'),
            const SizedBox(
              height: 20,
            ),
            //add a loading spinner
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
