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
    "Debattenkultur",
    "Frauenquote",
    "Waffenlieferungen",
    "Tempolimit",
    "Grundeinkommen",
    'Corona-Maßnahmen',
    "Zigaretten",
    "Smartphone",
    "AfD-Verbot",
  ];

  void setQuestions(String topic) {
    if (topic == "Erbschaftssteuer") {
      QuestionCreator().setErbschaftssteuerQuestions();
    } else if (topic == "Debattenkultur") {
      QuestionCreator().setDebattenkulturQuestions();
    } else if (topic == "Ananas") {
      QuestionCreator().setAnanasQuestions();
    } else if (topic == "Frauenquote") {
      QuestionCreator().setFrauenquoteQuestions();
    } else if (topic == "Waffenlieferungen") {
      QuestionCreator().setWaffenlieferungenQuestions();
    } else if (topic == "Tempolimit") {
      QuestionCreator().setTempolimitQuestions();
    } else if (topic == "Grundeinkommen") {
      QuestionCreator().setGrundeinkommenQuestions();
    } else if (topic == 'Corona-Maßnahmen') {
      QuestionCreator().setCoronaMassnahmenQuestions();
    } else if (topic == "Zigaretten") {
      QuestionCreator().setZigarettenkaufAlterQuestions();
    } else if (topic == "Smartphone") {
      QuestionCreator().setSmartphoneVerbotQuestions();
    } else if (topic == "AfD-Verbot") {
      QuestionCreator().setAfDVerbotQuestions();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Background'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('So kommst du in fünf Schritten ins Gespräch:\n'
                '1. Gesprächspartner:in finden.\n'
                '2. Eine Frage auswählen, auf die ihr unterschiedlich antworten würdet.\n'
                '3. Namen für euren Chat besprechen und eingeben.\n'
                '4. Frage und Prämissen beantworten und abschicken.\n'
                '5. Antworten vergleichen und darauf basierend über die Frage diskutieren.\n'
                'Über euer Feedback würden wir uns sehr freuen!'),
            const SizedBox(
              height: 20,
            ),
            const Text('Wähle ein Thema aus:', style: TextStyle(fontSize: 20)),
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
