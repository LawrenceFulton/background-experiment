import 'package:background_experiment/question.dart';
import 'package:background_experiment/questionNotifier.dart';

class QuestionCreator {
  Question _generateQuestion(String questionID, String text, String headline) {
    return Question(
      questionID: questionID,
      text: text,
      headline: headline,
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
    );
  }

  void setErbschaftssteuerQuestions() {
    Question question = _generateQuestion('q0', 'Sollte die Erbschaftssteuer abgeschafft werden?', 'Erbschaftssteuer');
    Question p1 = _generateQuestion('p1', 'Sollte die Erbschaftssteuer erhöht werden?', 'Erbschaftssteuer');
    Question p2 = _generateQuestion('p2', 'Sollte die Erbschaftssteuer gesenkt werden?', 'Erbschaftssteuer');
    Question p3 = _generateQuestion('p3', 'Sollte die Erbschaftssteuer gleich bleiben?', 'Erbschaftssteuer');
    Question p4 =
        _generateQuestion('p4', 'Sollte die Erbschaftssteuer für Unternehmen abgeschafft werden?', 'Erbschaftssteuer');

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4];
  }

  void setKlimawandelQuestions() {
    Question question = _generateQuestion('q0', 'Sollte mehr in erneuerbare Energien investiert werden?', 'Klimawandel');
    Question p1 = _generateQuestion('p1', 'Sollte die CO2-Steuer erhöht werden?', 'Klimawandel');
    Question p2 = _generateQuestion('p2', 'Sollte der Kohleabbau sofort gestoppt werden?', 'Klimawandel');
    Question p3 =
        _generateQuestion('p3', 'Sollte der Ausbau des öffentlichen Verkehrs vorangetrieben werden?', 'Klimawandel');
    Question p4 = _generateQuestion('p4', 'Sollten Flugreisen stärker reguliert werden?', 'Klimawandel');

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4];
  }

  void setGleichberechtigungQuestions() {
    Question question =
        _generateQuestion('q0', 'Sollte es eine Frauenquote in Unternehmen geben?', 'Gleichberechtigung');
    Question p1 = _generateQuestion('p1', 'Sollte es gleiche Bezahlung für gleiche Arbeit geben?', 'Gleichberechtigung');
    Question p2 =
        _generateQuestion('p2', 'Sollte es strengere Gesetze gegen Diskriminierung geben?', 'Gleichberechtigung');
    Question p3 =
        _generateQuestion('p3', 'Sollte Elternzeit gleichermaßen für Männer und Frauen gelten?', 'Gleichberechtigung');
    Question p4 =
        _generateQuestion('p4', 'Sollte Elternzeit gleichermaßen für Männer und Frauen gelten?', 'Gleichberechtigung');
    Question p5 =
        _generateQuestion('p5', 'Sollte der Gender Pay Gap gesetzlich abgeschafft werden?', 'Gleichberechtigung');

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5];
  }

  void setCoronaQuestions() {
    Question question = _generateQuestion('q0', 'Sollten Impfungen verpflichtend sein?', 'Corona');
    Question p1 = _generateQuestion('p1', 'Sollten Lockdowns wieder eingeführt werden?', 'Corona');
    Question p2 = _generateQuestion('p2', 'Sollte Homeoffice zur Pflicht werden?', 'Corona');
    Question p3 =
        _generateQuestion('p3', 'Sollte es eine Maskenpflicht in öffentlichen Verkehrsmitteln geben?', 'Corona');
    Question p4 = _generateQuestion('p4', 'Sollten Großveranstaltungen verboten werden?', 'Corona');

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4];
  }

  void setRassismusQuestions() {
    Question question = _generateQuestion('q0', 'Sollte Racial Profiling verboten werden?', 'Rassismus');
    Question p1 = _generateQuestion('p1', 'Sollten mehr Mittel gegen Rassismus bereitgestellt werden?', 'Rassismus');
    Question p2 = _generateQuestion('p2', 'Sollten antirassistische Schulungen verpflichtend sein?', 'Rassismus');
    Question p3 = _generateQuestion('p3', 'Sollten rassistische Straftaten härter bestraft werden?', 'Rassismus');
    Question p4 = _generateQuestion(
        'p4', 'Sollte rassistische Diskriminierung am Arbeitsplatz strenger reguliert werden?', 'Rassismus');

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4];
  }

  void setWirtschaftQuestions() {
    Question q = _generateQuestion('q0', 'Sollte der Mindestlohn erhöht werden?', 'Wirtschaft');
    Question p1 = _generateQuestion('p1', 'Sollte es mehr Investitionen in Infrastruktur geben?', 'Wirtschaft');
    Question p2 = _generateQuestion('p2', 'Sollten Unternehmenssteuern gesenkt werden?', 'Wirtschaft');
    Question p3 = _generateQuestion('p3', 'Sollte es stärkere Regulierungen für Großunternehmen geben?', 'Wirtschaft');
    Question p4 = _generateQuestion('p4', 'Sollten Startups stärker gefördert werden?', 'Wirtschaft');

    QuestionNotifier().currentQuestion = q;
    QuestionNotifier().premises = [p1, p2, p3, p4];
  }
}
