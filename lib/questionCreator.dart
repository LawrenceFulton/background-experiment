import 'package:background_experiment/question.dart';
import 'package:background_experiment/questionNotifier.dart';

class QuestionCreator {
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

  void setKlimawandelQuestions() {
    Question q1 = Question(
      questionID: '1',
      text: 'Sollte mehr in erneuerbare Energien investiert werden?',
      headline: 'Klimawandel',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q2 = Question(
      questionID: '2',
      text: 'Sollte die CO2-Steuer erhöht werden?',
      headline: 'Klimawandel',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q3 = Question(
      questionID: '3',
      text: 'Sollte der Kohleabbau sofort gestoppt werden?',
      headline: 'Klimawandel',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q4 = Question(
      questionID: '4',
      text: 'Sollte der Ausbau des öffentlichen Verkehrs vorangetrieben werden?',
      headline: 'Klimawandel',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q5 = Question(
      questionID: '5',
      text: 'Sollten Flugreisen stärker reguliert werden?',
      headline: 'Klimawandel',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    QuestionNotifier().questions = [q1, q2, q3, q4, q5];
  }

  void setGleichberechtigungQuestions() {
    Question q1 = Question(
      questionID: '1',
      text: 'Sollte es eine Frauenquote in Unternehmen geben?',
      headline: 'Gleichberechtigung',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q2 = Question(
      questionID: '2',
      text: 'Sollte es gleiche Bezahlung für gleiche Arbeit geben?',
      headline: 'Gleichberechtigung',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q3 = Question(
      questionID: '3',
      text: 'Sollte es strengere Gesetze gegen Diskriminierung geben?',
      headline: 'Gleichberechtigung',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q4 = Question(
      questionID: '4',
      text: 'Sollte Elternzeit gleichermaßen für Männer und Frauen gelten?',
      headline: 'Gleichberechtigung',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q5 = Question(
      questionID: '5',
      text: 'Sollte der Gender Pay Gap gesetzlich abgeschafft werden?',
      headline: 'Gleichberechtigung',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    QuestionNotifier().questions = [q1, q2, q3, q4, q5];
  }

  void setCoronaQuestions() {
    Question q1 = Question(
      questionID: '1',
      text: 'Sollten Impfungen verpflichtend sein?',
      headline: 'Corona',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q2 = Question(
      questionID: '2',
      text: 'Sollten Lockdowns wieder eingeführt werden?',
      headline: 'Corona',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q3 = Question(
      questionID: '3',
      text: 'Sollte Homeoffice zur Pflicht werden?',
      headline: 'Corona',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q4 = Question(
      questionID: '4',
      text: 'Sollte es eine Maskenpflicht in öffentlichen Verkehrsmitteln geben?',
      headline: 'Corona',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q5 = Question(
      questionID: '5',
      text: 'Sollten Großveranstaltungen verboten werden?',
      headline: 'Corona',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    QuestionNotifier().questions = [q1, q2, q3, q4, q5];
  }

  void setRassismusQuestions() {
    Question q1 = Question(
      questionID: '1',
      text: 'Sollte Racial Profiling verboten werden?',
      headline: 'Rassismus',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q2 = Question(
      questionID: '2',
      text: 'Sollten mehr Mittel gegen Rassismus bereitgestellt werden?',
      headline: 'Rassismus',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q3 = Question(
      questionID: '3',
      text: 'Sollten antirassistische Schulungen verpflichtend sein?',
      headline: 'Rassismus',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q4 = Question(
      questionID: '4',
      text: 'Sollten rassistische Straftaten härter bestraft werden?',
      headline: 'Rassismus',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q5 = Question(
      questionID: '5',
      text: 'Sollte rassistische Diskriminierung am Arbeitsplatz strenger reguliert werden?',
      headline: 'Rassismus',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    QuestionNotifier().questions = [q1, q2, q3, q4, q5];
  }

  void setWirtschaftQuestions() {
    Question q1 = Question(
      questionID: '1',
      text: 'Sollte der Mindestlohn erhöht werden?',
      headline: 'Wirtschaft',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q2 = Question(
      questionID: '2',
      text: 'Sollte es mehr Investitionen in Infrastruktur geben?',
      headline: 'Wirtschaft',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q3 = Question(
      questionID: '3',
      text: 'Sollten Unternehmenssteuern gesenkt werden?',
      headline: 'Wirtschaft',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q4 = Question(
      questionID: '4',
      text: 'Sollte es stärkere Regulierungen für Großunternehmen geben?',
      headline: 'Wirtschaft',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    Question q5 = Question(
      questionID: '5',
      text: 'Sollten Startups stärker gefördert werden?',
      headline: 'Wirtschaft',
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );

    QuestionNotifier().questions = [q1, q2, q3, q4, q5];
  }
}
