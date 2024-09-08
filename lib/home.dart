import 'package:background_experiment/enum/app_variant.dart';
import 'package:background_experiment/questionCreator.dart';
import 'package:background_experiment/service/variant_service.dart';
import 'package:background_experiment/topics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Topic> topics = [];

  List<Topic> _getAllTopics() {
    return Topic.values.toList();
  }

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
    return Selector<VariantService, AppVariant>(
      selector: (context, variantService) => variantService.variant,
      builder: (context, variant, child) {
        print("$variant in home");
        switch (variant) {
          case AppVariant.normal:
            return defaultWidget(context);
          case AppVariant.changeSchool:
            return changeSchoolWidget(context);
        }
      },
    );
  }

  Widget defaultWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Background'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('So kommst du in fünf Schritten ins Gespräch:\n'
                  '1. Gesprächspartner:in finden.\n'
                  '2. Die Frage, die euch zugewiesen wurde, auswählen.\n'
                  '3. Einzigartigen Namen für euren Chat besprechen und eingeben.\n'
                  '4. Frage und Prämissen beantworten und abschicken.\n'
                  '5. Antworten vergleichen und darauf basierend über die Frage diskutieren.\n'
                  'Über euer Feedback würden wir uns sehr freuen!'),
              const SizedBox(
                height: 20,
              ),
              const Text('Wähle ein Thema aus:', style: TextStyle(fontSize: 20)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var topic in topics)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setQuestions(topic);
                          Navigator.pushNamed(
                            context,
                            '/new',
                          );
                        },
                        child: Text(topic.value),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget changeSchoolWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change School'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('So kommst du in fünf Schritten ins Gespräch:\n'
                  '1. Gesprächspartner:in finden.\n'
                  '2. Die Frage, die euch zugewiesen wurde, auswählen.\n'
                  '3. Einzigartigen Namen für euren Chat besprechen und eingeben.\n'
                  '4. Frage und Prämissen beantworten und abschicken.\n'
                  '5. Antworten vergleichen und darauf basierend über die Frage diskutieren.\n'
                  'Über euer Feedback würden wir uns sehr freuen!'),
              const SizedBox(
                height: 20,
              ),
              const Text('Wähle ein Thema aus:', style: TextStyle(fontSize: 20)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var topic in topics)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setQuestions(topic);
                          Navigator.pushNamed(
                            context,
                            '/new',
                          );
                        },
                        child: Text(topic.value),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
