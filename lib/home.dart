import 'package:background_experiment/new.dart';
import 'package:background_experiment/question.dart';
import 'package:background_experiment/questionCreator.dart';
import 'package:background_experiment/questionNotifier.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> topics = [
    "Erbschaftssteuer",
    "Klimawandel",
    "Gleichberechtigung",
    "Corona",
    "Rassismus",
    "Wirtschaft",
  ];

  void setErbschaftssteuerQuestions() {
    Question q1 = Question(
      questionID: '1',
      text: 'Sollte die Erbschaftssteuer abgeschafft werden?',
      headline: 'Erbschaftssteuer',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q2 = Question(
      questionID: '2',
      text: 'Sollte die Erbschaftssteuer erhöht werden?',
      headline: 'Erbschaftssteuer',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q3 = Question(
      questionID: '3',
      text: 'Sollte die Erbschaftssteuer gesenkt werden?',
      headline: 'Erbschaftssteuer',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q4 = Question(
      questionID: '4',
      text: 'Sollte die Erbschaftssteuer gleich bleiben?',
      headline: 'Erbschaftssteuer',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q5 = Question(
      questionID: '5',
      text: 'Sollte die Erbschaftssteuer für Unternehmen abgeschafft werden?',
      headline: 'Erbschaftssteuer',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    QuestionNotifier().questions = [q1, q2, q3, q4, q5];
  }

  void setQuestions(String topic) {
    if (topic == "Erbschaftssteuer") {
      QuestionCreator().setErbschaftssteuerQuestions();
    } else if (topic == "Klimawandel") {
      QuestionCreator().setKlimawandelQuestions();
    } else if (topic == "Gleichberechtigung") {
      QuestionCreator().setGleichberechtigungQuestions();
    } else if (topic == "Corona") {
      QuestionCreator().setCoronaQuestions();
    } else if (topic == "Rassismus") {
      QuestionCreator().setRassismusQuestions();
    } else if (topic == "Wirtschaft") {
      QuestionCreator().setWirtschaftQuestions();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('Welches Thema haben Sie Sich zum Diskutieren ausgesucht?'),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setQuestions(topics[index]);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewQuestions(),
                          ),
                        );
                      },
                      child: Text(topics[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
