import 'package:background_experiment/question.dart';
import 'package:background_experiment/questionNotifier.dart';

class QuestionCreator {
  Question _generateQuestion(String questionID, String text, String headline, {List<String>? alternativeScale}) {
    return Question(
      questionID: questionID,
      text: text,
      headline: headline,
      isStatement: false,
      creatorID: '',
      wasEdited: false,
      userID: '',
      alternativeScale: alternativeScale,
    );
  }

  void setErbschaftssteuerQuestions() {
    Question question = _generateQuestion('q0',
        'Bist du der Meinung, dass der Steuersatz auf Erbschaften in Deutschland zu niedrig ist?', 'Erbschaftssteuer');
    Question p1 = _generateQuestion('p1', 'Ist die wirtschaftliche Ungleichheit in Deutschland zu groß?', "");
    Question p2 = _generateQuestion(
        'p2',
        'Ganz grundsätzlich, ist es für eine Gesellschaft positiv oder negativ, dass Menschen Wohlstand besitzen können, den sie sich selbst nicht erarbeitet haben?',
        '');
    Question p3 = _generateQuestion(
        'p3', 'Soll die Verteilung von Einkommen und Vermögen prinzipiell durch Besteuerung beeinflusst werden?', '');

    Question p4 = _generateQuestion(
        'p4',
        'Sind äußere Umstände in unserer Gesellschaft maßgeblich dafür verantwortlich in welchen Lebenssituationen sich Menschen befinden?',
        '');
    Question p5 = _generateQuestion(
        "p5",
        "Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Sie die Wahl hätten, würden Sie sich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?",
        '',
        alternativeScale: ['Soziale Gerechtigkeit', 'Individuelle Freiheit']);

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5];
  }

  void setDebattenkulturQuestions() {
    Question question =
        _generateQuestion('q0', 'Ist die Debattenkultur in Deutschland schlechter geworden?', 'Debattenkultur');
    Question p1 = _generateQuestion(
        'p1',
        'Hast du das Gefühl, dass man heute in Deutschland seine politische Meinung frei sagen kann, oder ist es besser, vorsichtig zu sein?',
        '',
        alternativeScale: ['Frei', 'Vorsichtig']);
    Question p2 = _generateQuestion(
        'p2',
        'Bist du mit der Art und Weise, wie die Demokratie in Deutschland funktioniert, alles in allem gesehen zufrieden?',
        '');
    Question p3 = _generateQuestion(
        'p3',
        'Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Sie die Wahl hätten, würden Sie sich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?',
        '',
        alternativeScale: ['Soziale Gerechtigkeit', 'Individuelle Freiheit']);
    Question p4 = _generateQuestion('p4', 'Ist die “Cancel Culture” ein Problem?', '');
    Question p5 = _generateQuestion('p5', 'Findest du, dass Social Media die Debattenkultur verschlechtert haben?', '');

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5];
  }

  void setAnanasQuestions() {
    Question question = _generateQuestion('q0', 'Sollte Ananas auf Pizza verboten werden?', 'Ananas');
    Question p1 = _generateQuestion('p1', 'Sollte Pizza generell verboten werden?', '');
    Question p2 = _generateQuestion('p2', 'Ist süß besser als salzig?', '');
    Question p3 = _generateQuestion('p3', 'Ist Fusion-Küche prinzipiell ein guter Ansatz?', '');
    Question p4 = _generateQuestion('p4', 'Ist regelmäßig neues Essen zu probieren wichtig?', '');
    Question p5 = _generateQuestion('p5', 'Bedeutet schlechtes Essen kulturellen Verfall?', '');

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5];
  }

  void setFrauenquoteQuestions() {
    Question question = _generateQuestion(
        'q0', 'Brauchen wir eine gesetzlich festgeschriebene Frauenquote für Führungspositionen?', 'Frauenquote');
    Question p1 = _generateQuestion(
        'p1',
        'Wer sollte für das Wohlergehen von Menschen in einem Land verantwortlich sein, der Staat oder das Individuum?',
        '',
        alternativeScale: ['Staat', 'Individuum']);
    Question p2 = _generateQuestion(
        'p2',
        'Sind äußere Umstände in unserer Gesellschaft maßgeblich dafür verantwortlich in welchen Lebenssituationen sich Menschen befinden?',
        '');
    Question p3 = _generateQuestion('p3', 'Wer hat in unserer Gesellschaft mehr Vorteile – Männer oder Frauen?', '',
        alternativeScale: ['Männer', 'Frauen']);
    Question p4 = _generateQuestion(
        'p4',
        'Sind Unterschiede zwischen Jungen und Mädchen in der Gesellschaft (Berufswunsch, Hobbies, Schulnoten etc.) eher auf biologische oder eher auf soziale Faktoren zurückzuführen?',
        '',
        alternativeScale: ['Biologisch', 'Sozial']);
    Question p5 = _generateQuestion(
        'p5',
        'Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Sie die Wahl hätten, würden Sie sich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?',
        '',
        alternativeScale: ['Soziale Gerechtigkeit', 'Individuelle Freiheit']);

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5];
  }

  void setWaffenlieferungenQuestions() {
    Question question =
        _generateQuestion('q0', 'Sollte Deutschland mehr Waffen an die Ukraine liefern?', 'Waffenlieferungen');
    Question p1 =
        _generateQuestion('p1', 'Findest du, dass der “Westen” Mitschuld an dem Krieg in der Ukraine hat?', '');
    Question p2 = _generateQuestion(
        'p2', 'Denkst du, dass Russland, wenn die Ukraine verlieren würde, weitere Länder angreifen würde?', '');
    Question p3 = _generateQuestion(
        'p3', 'Glaubst du, dass beide Seiten prinzipiell Interesse an Friedensverhandlungen haben?', '');
    Question p4 = _generateQuestion(
        'p4',
        'Findest du, dass ein Staat sich primär um seine eigenen Bürger kümmern sollte, auch wenn dies Nachteile für andere Menschen bedeuten würde?',
        '');
    Question p5 = _generateQuestion(
        'p5',
        'Findest du, dass es prinzipiell für die internationale Sicherheit wichtig ist, dass Staaten sich militärisch verteidigen können?',
        '');

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5];
  }

  void setTempolimitQuestions() {
    Question question =
        _generateQuestion('q0', 'Brauchen wir ein Tempolimit von 130 km/h auf der Autobahn?', 'Tempolimit');
    Question p1 = _generateQuestion('p1', 'Tut Deutschland alles in allem genug gegen den Klimawandel?', '');
    Question p2 = _generateQuestion(
        'p2', 'Denkst du, dass der Klimawandel die Lebensqualität auch in Europa stark verringern wird?', '');
    Question p3 = _generateQuestion(
        'p3',
        'Findest du, dass ein Staat sich primär um seine eigenen Bürger kümmern sollte, auch wenn dies Nachteile für andere Menschen bedeuten würde?',
        '');
    Question p4 = _generateQuestion(
        'p4', 'Findest du, dass andere Länder eher in der Pflicht sind, mehr gegen den Klimawandel zu tun?', '');
    Question p5 = _generateQuestion(
        'p5',
        'Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Sie die Wahl hätten, würden Sie sich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?',
        '',
        alternativeScale: ['Soziale Gerechtigkeit', 'Individuelle Freiheit']);

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5];
  }

  void setGrundeinkommenQuestions() {
    Question question = _generateQuestion('q0', 'Brauchen wir ein Bedingungsloses Grundeinkommen?', 'Grundeinkommen');
    Question p1 = _generateQuestion(
        'p1',
        'Wer sollte für das Wohlergehen von Menschen in einem Land verantwortlich sein, der Staat oder das Individuum?',
        '',
        alternativeScale: ['Staat', 'Individuum']);
    Question p2 = _generateQuestion(
        'p2',
        'Sind äußere Umstände in unserer Gesellschaft maßgeblich dafür verantwortlich in welchen Lebenssituationen sich Menschen befinden?',
        '');
    Question p3 = _generateQuestion('p3', 'Glaubst du, dass durch KI viele Jobs wegfallen werden?', '');
    Question p4 = _generateQuestion('p4', 'Findest du, dass sich Leistung in Deutschland lohnt?', '');
    Question p5 = _generateQuestion(
        'p5',
        'Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Sie die Wahl hätten, würden Sie sich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?',
        '',
        alternativeScale: ['Soziale Gerechtigkeit', 'Individuelle Freiheit']);

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5];
  }

  void setCoronaMassnahmenQuestions() {
    Question question = _generateQuestion(
        'q0',
        'Findest du, dass die Medien ausgewogen über die Pandemie und die Diskussionen um die Maßnahmen berichtet haben?',
        'Corona-Maßnahmen');

    Question p1 =
        _generateQuestion('p1', 'Waren die Maßnahmen gegen das Corona-Virus im Großen und Ganzen sinnvoll?', '');
    Question p2 = _generateQuestion(
        'p2',
        'Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Sie die Wahl hätten, würden Sie sich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?',
        '',
        alternativeScale: ['Soziale Gerechtigkeit', 'Individuelle Freiheit']);
    Question p3 = _generateQuestion('p3', 'Vertraust Du grundsätzlich der deutschen Regierung?', '');
    Question p4 = _generateQuestion(
        'p4',
        'Findest du, dass alle Gruppen während der Entscheidung über die Maßnahmen ausreichend berücksichtigt wurden?',
        '');
    Question p5 = _generateQuestion('p5',
        'Rechtfertigt das Retten eines Leben die Verschlechterung der Lebensumstände von vielen anderen Menschen?', '');

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5];
  }

  void setZigarettenkaufAlterQuestions() {
    Question question = _generateQuestion(
        'q0',
        'In einem Gesetzentwurf in Großbritannien soll das Mindestalter für den Kauf von Zigaretten jedes Jahr angehoben werden. Wer jetzt unter 16 ist, wird somit nie legal Zigaretten kaufen dürfen. Hältst du das Gesetz für sinnvoll?',
        'Zigarettenkauf-Alter');
    Question p1 = _generateQuestion(
        'p1', 'Glaubst du, dass die Regelung funktionieren und den Zigarettenkonsum stark einschränken würde?', '');
    Question p2 = _generateQuestion(
        'p2',
        'Wer sollte für das Wohlergehen von Menschen in einem Land verantwortlich sein, der Staat oder das Individuum?',
        '',
        alternativeScale: ['Staat', 'Individuum']);
    Question p3 = _generateQuestion(
        'p3',
        'Ist es prinzipiell erlaubt, individuelle Freiheit einzuschränken, um Menschen zu besseren Verhaltensweisen zu bringen?',
        '');
    Question p4 = _generateQuestion(
        'p4',
        'Ist es immer moralisch sich an die geltenden Gesetze zu halten, oder glauben sie, dass es in manchen Fällen moralisch geboten ist gegen Gesetze zu verstoßen?',
        '',
        alternativeScale: ['Immer', 'In manchen Fällen']);
    Question p5 = _generateQuestion(
        'p5',
        'Ist es richtig, gewisse Regeln auf einmal zu verändern und so verschiedene Lebensrealitäten für verschiedene Generationen zu schaffen?',
        '');

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5];
  }

  void setSmartphoneVerbotQuestions() {
    Question question = _generateQuestion('q0', 'Sollten Smartphones an Schulen verboten werden?', 'Smartphone-Verbot');
    Question p1 = _generateQuestion(
        'p1', 'Glaubst du, dass die Regelung funktionieren und die Smartphonenutzung stark einschränken würde?', '');
    Question p2 = _generateQuestion('p2', 'Macht die Digitalisierung die Gesellschaft insgesamt besser?', '');
    Question p3 = _generateQuestion('p3', 'Macht Social Media die Gesellschaft insgesamt besser?', '');
    Question p4 = _generateQuestion('p4', 'Ist es generell richtig, Kinder in manchen Fällen zu bevormunden?', '');
    Question p5 = _generateQuestion('p5', 'Menschen besitzen einen freien Willen.', '');

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5];
  }

  void setAfDVerbotQuestions() {
    Question question = _generateQuestion('q0', 'Sollte die AfD verboten werden?', 'AfD-Verbot');
    Question p1 = _generateQuestion('p1', 'Sind rechte Parteien eine Gefahr für unsere Demokratie?', '');
    Question p2 = _generateQuestion(
        'p2',
        'Hältst du eine Regierungsbeteiligung (Bund oder Länder) der AfD in den nächsten 10 Jahren für wahrscheinlich?',
        '');
    Question p3 = _generateQuestion('p3', 'Kannst du die Motivation, die AfD zu wählen, nachvollziehen?', '');
    Question p4 = _generateQuestion(
        'p4',
        'Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Sie die Wahl hätten, würden Sie sich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?',
        '',
        alternativeScale: ['Soziale Gerechtigkeit', 'Individuelle Freiheit']);
    Question p5 = _generateQuestion('p5', 'Vertrauen Sie grundsätzlich der deutschen Regierung?', '');

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5];
  }
}
