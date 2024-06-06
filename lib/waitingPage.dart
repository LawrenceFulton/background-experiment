import 'package:background_experiment/userAnswerSender.dart';
import 'package:flutter/material.dart';

import 'otherPerson.dart';

class WaitingPage extends StatefulWidget {
  final String chatIdentifier;
  final String otherPersonsUserID;

  const WaitingPage({super.key, required this.chatIdentifier, required this.otherPersonsUserID});

  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  void onPressed() async {
    UserAnswerSender().getUserAnswers(widget.chatIdentifier, widget.otherPersonsUserID).then((value) {
      if (value.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtherPerson(
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
      appBar: AppBar(
        title: const Text('Warte auf Antwort'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text('Warte auf Antwort von Ihrer/m GesprächspartnerIn'),
          const SizedBox(
            height: 20,
          ),
          // button to check if the other person has answered
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Antwort prüfen'),
          ),
        ],
      ),
    );
  }
}
