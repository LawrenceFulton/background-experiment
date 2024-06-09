import 'package:background_experiment/new.dart';
import 'package:background_experiment/questionCreator.dart';
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
