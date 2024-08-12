import 'package:background_experiment/new.dart';
import 'package:background_experiment/questionCreator.dart';
import 'package:background_experiment/topics.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Topic> _getAllTopics() {
    return Topic.values.toList();
  }

  final List<Topic> topics = [];

  @override
  void initState() {
    super.initState();
    topics.addAll(_getAllTopics());
  }

  void setQuestions(Topic topic) {
    if (topic == Topic.erbschaftsteuer) {
      QuestionCreator().setErbschaftssteuerQuestions();
    } else if (topic == Topic.frauenquote) {
      QuestionCreator().setFrauenquoteQuestions();
    } else if (topic == Topic.waffenlieferungen) {
      QuestionCreator().setWaffenlieferungenQuestions();
    } else if (topic == Topic.tempolimit) {
      QuestionCreator().setTempolimitQuestions();
    } else if (topic == Topic.grundeinkommen) {
      QuestionCreator().setGrundeinkommenQuestions();
    } else if (topic == Topic.coronaMassnahmen) {
      QuestionCreator().setCoronaMassnahmenQuestions();
    } else if (topic == Topic.smartphoneVerbot) {
      QuestionCreator().setSmartphoneVerbotQuestions();
    } else if (topic == Topic.raumfahrt) {
      QuestionCreator().setRaumfahrtQuestions();
    } else if (topic == Topic.plastikdeckel) {
      QuestionCreator().setPlastikLidQuestions();
    } else if (topic == Topic.selbstbestimmungsgesetz) {
      QuestionCreator().setSelfDeterminationLaw();
    } else if (topic == Topic.afdVerbot) {
      QuestionCreator().setAfDVerbotQuestions();
    } else if (topic == Topic.zigarettenverbot) {
      QuestionCreator().setZigarettenkaufAlterQuestions();
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
                '2. Die Frage auswählen die euch zugewiesen wurden ist..\n'
                '3. Einzigartigen Namen für euren Chat besprechen und eingeben.\n'
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
                      child: Text(topics[index].value),
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
