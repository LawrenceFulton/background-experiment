import 'package:background_experiment/contextExtension.dart';
import 'package:background_experiment/questionAnswerPair.dart';
import 'package:background_experiment/userAnswerSender.dart';
import 'package:flutter/material.dart';

class WaitingPage extends StatefulWidget {
  const WaitingPage({super.key});

  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  late String chatIdentifier;
  late List<QuestionAnswerPair> ownAnswers;
  late String otherPersonsUserID;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    chatIdentifier = args['chatIdentifier'];
    ownAnswers = args['ownAnswers'];
    otherPersonsUserID = args['otherPersonsUserID'];
    subscribeToAnswers();
  }

  void subscribeToAnswers() {
    UserAnswerSender().getUserAnswersStream(chatIdentifier, otherPersonsUserID).listen((value) {
      if (value.isNotEmpty) {
        Navigator.pushNamed(
          context,
          '/compare',
          arguments: {
            'chatIdentifier': chatIdentifier,
            'ownAnswers': ownAnswers,
            'otherPersonsAnswers': value,
          },
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
            const Text('Bitte warten Sie einen Moment, die Chatidentifikation für Ihre/n PartnerIn lautet wie folgt:'),
            Text(chatIdentifier, style: const TextStyle(fontWeight: FontWeight.bold)),
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
