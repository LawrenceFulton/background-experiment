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

    // Ist die wirtschaftliche Ungleichheit in Deutschland zu groß?
    // Ist eine Gleichbehandlung kleiner und großer Vermögen bei der Erbfolge aus Gerechtigkeitsgründen geboten?
    // Siehst Du das in Unternehmen gebundene Vermögen als besonders schutzwürdig an?
    // Ganz grundsätzlich, ist es für eine Gesellschaft positiv oder negativ, dass Menschen Wohlstand besitzen können, den sie sich selbst nicht erarbeitet haben?
    // Soll die Verteilung von Einkommen und Vermögen prinzipiell durch Besteuerung beeinflusst werden?
    // Vom Tellerwäscher zum Millionär - ist das in Deutschland ein relevantes Szenario?
    // Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?

    Question p1 = _generateQuestion('p1', 'Ist die wirtschaftliche Ungleichheit in Deutschland zu groß?', '');
    Question p2 = _generateQuestion(
        'p2',
        'Ist eine Gleichbehandlung kleiner und großer Vermögen bei der Erbfolge aus Gerechtigkeitsgründen geboten?',
        '');
    Question p3 =
        _generateQuestion('p3', 'Siehst Du das in Unternehmen gebundene Vermögen als besonders schutzwürdig an?', '');
    Question p4 = _generateQuestion(
        'p4',
        'Ganz grundsätzlich, ist es für eine Gesellschaft positiv oder negativ, dass Menschen Wohlstand besitzen können, den sie sich selbst nicht erarbeitet haben?',
        '',
        alternativeScale: ['Negativ', 'Positiv']);
    Question p5 = _generateQuestion(
        'p5', 'Soll die Verteilung von Einkommen und Vermögen prinzipiell durch Besteuerung beeinflusst werden?', '');
    Question p6 = _generateQuestion(
        'p6', 'Vom Tellerwäscher zum Millionär - ist das in Deutschland ein relevantes Szenario?', '');
    Question p7 = _generateQuestion(
        'p7',
        'Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?',
        '',
        alternativeScale: ['Soziale Gerechtigkeit', 'Individuelle Freiheit']);

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5, p6, p7];
  }

  void setFrauenquoteQuestions() {
    Question question = _generateQuestion(
        'q0', 'Brauchen wir eine gesetzlich festgeschriebene Frauenquote für Führungspositionen?', 'Frauenquote');

    // Glaubst Du, dass durch mehr Frauen in Führungspersonen ein positiver Effekt für die gesamte Gesellschaft entstehen würde?
    // Gäbe es noch nicht ausgeschöpfte, andere Maßnahmen, Frauen den Aufstieg in Führungspositionen zu erleichtern?
    // Wer hat in unserer Gesellschaft mehr Vorteile – Männer oder Frauen?
    // Sind Unterschiede zwischen Jungen und Mädchen in der Gesellschaft (Berufswunsch, Hobbies, Schulnoten etc.) eher auf biologische oder eher auf soziale Faktoren zurückzuführen?
    // Wer sollte für das Wohlergehen von Menschen in einem Land verantwortlich sein, der Staat oder das Individuum?
    // Sind äußere Umstände in unserer Gesellschaft maßgeblich dafür verantwortlich in welchen Lebenssituationen sich Menschen befinden?
    // Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?

    Question p1 = _generateQuestion(
        'p1',
        'Glaubst Du, dass durch mehr Frauen in Führungspersonen ein positiver Effekt für die gesamte Gesellschaft entstehen würde?',
        '');
    Question p2 = _generateQuestion(
        'p2',
        'Gäbe es noch nicht ausgeschöpfte, andere Maßnahmen, Frauen den Aufstieg in Führungspositionen zu erleichtern?',
        '');
    Question p3 = _generateQuestion('p3', 'Wer hat in unserer Gesellschaft mehr Vorteile – Männer oder Frauen?', '',
        alternativeScale: ['Männer', 'Frauen']);
    Question p4 = _generateQuestion(
        'p4',
        'Sind Unterschiede zwischen Jungen und Mädchen in der Gesellschaft (Berufswunsch, Hobbies, Schulnoten etc.) eher auf biologische oder eher auf soziale Faktoren zurückzuführen?',
        '',
        alternativeScale: ['Biologische Faktoren', 'Soziale Faktoren']);
    Question p5 = _generateQuestion(
        'p5',
        'Wer sollte für das Wohlergehen von Menschen in einem Land verantwortlich sein, der Staat oder das Individuum?',
        '',
        alternativeScale: ['Staat', 'Individuum']);
    Question p6 = _generateQuestion(
        'p6',
        'Sind äußere Umstände in unserer Gesellschaft maßgeblich dafür verantwortlich in welchen Lebenssituationen sich Menschen befinden?',
        '');
    Question p7 = _generateQuestion(
        'p7',
        'Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?',
        '',
        alternativeScale: ['Soziale Gerechtigkeit', 'Individuelle Freiheit']);

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5, p6, p7];
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

  void setWaffenlieferungenQuestions() {
    Question question =
        _generateQuestion('q0', 'Sollte Deutschland mehr Waffen an die Ukraine liefern?', 'Waffenlieferungen');

    // Findest du, dass der Westen Mitschuld an dem Krieg in der Ukraine hat?
    // Denkst du es besteht die Möglichkeit, dass Russland, wenn die Ukraine verlieren würde, Nato-Staaten angreifen könnte?
    // Befürchtest Du, dass ein Russland, das im Krieg zu verlieren droht, seine Atomwaffen zum Einsatz bringen würde?
    // Glaubst Du, dass der Krieg in der Ukraine mit militärischen Mitteln beendet werden kann?
    // Glaubst du, dass beide Seiten prinzipiell Interesse an Friedensverhandlungen haben?
    // Ist Deutschland wirtschaftlich stark genug, sowohl in die Bundeswehr zu investieren als auch einen großen Beitrag zur militärischen Unterstützung der Ukraine zu leisten?
    // Ist eine NATO-Mitgliedschaft der Ukraine im deutschen Interesse?
    // Findest du, dass ein Staat sich primär um seine eigenen Bürger kümmern sollte, auch wenn dies Nachteile für andere Menschen bedeuten würde?
    // Findest du, dass es prinzipiell für die internationale Sicherheit wichtig ist, dass Staaten sich militärisch verteidigen können?
    //

    Question p1 = _generateQuestion('p1', 'Findest du, dass der Westen Mitschuld an dem Krieg in der Ukraine hat?', '');
    Question p2 = _generateQuestion(
        'p2',
        'Denkst du es besteht die Möglichkeit, dass Russland, wenn die Ukraine verlieren würde, Nato-Staaten angreifen könnte?',
        '');
    Question p3 = _generateQuestion(
        'p3',
        'Befürchtest Du, dass ein Russland, das im Krieg zu verlieren droht, seine Atomwaffen zum Einsatz bringen würde?',
        '');
    Question p4 = _generateQuestion(
        'p4', 'Glaubst Du, dass der Krieg in der Ukraine mit militärischen Mitteln beendet werden kann?', '');
    Question p5 = _generateQuestion(
        'p6',
        'Ist Deutschland wirtschaftlich stark genug, sowohl in die Bundeswehr zu investieren als auch einen großen Beitrag zur militärischen Unterstützung der Ukraine zu leisten?',
        '');
    Question p6 = _generateQuestion('p7', 'Ist eine NATO-Mitgliedschaft der Ukraine im deutschen Interesse?', '');
    Question p7 = _generateQuestion(
        'p8',
        'Findest du, dass ein Staat sich primär um seine eigenen Bürger kümmern sollte, auch wenn dies Nachteile für andere Menschen bedeuten würde?',
        '');

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5, p6, p7];
  }

  void setTempolimitQuestions() {
    Question question =
        _generateQuestion('q0', 'Brauchen wir ein Tempolimit von 130 km/h auf der Autobahn?', 'Tempolimit');

    // Denkst Du, dass ein Tempolimit von 130 km/h die Unfallgefahr signifikant senkt?
    // Findest Du, dass das Unfallrisiko auf der Autobahn derzeit zu hoch ist?
    // Stehst Du dem Fortbewegungsmittel “PKW” grundsätzlich positiv gegenüber?
    // Gehst Du davon aus, dass die Einführung eines Tempolimits von 130 km/h einen Einfluss auf das globale Klima haben wird?
    // Tut Deutschland alles in allem genug gegen den Klimawandel?
    // Denkst du, dass der Klimawandel die Lebensqualität auch in Europa stark verringern wird?
    // Gesamtgesellschaftliche Ziele und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für die gesamtgesellschaftliche Ziele oder individuelle Freiheit entscheiden?

    Question p1 =
        _generateQuestion('p1', 'Denkst Du, dass ein Tempolimit von 130 km/h die Unfallgefahr signifikant senkt?', '');
    Question p2 =
        _generateQuestion('p2', 'Findest Du, dass das Unfallrisiko auf der Autobahn derzeit zu hoch ist?', '');
    Question p3 =
        _generateQuestion('p3', 'Stehst Du dem Fortbewegungsmittel “PKW” grundsätzlich positiv gegenüber?', '');
    Question p4 = _generateQuestion(
        'p4',
        'Gehst Du davon aus, dass die Einführung eines Tempolimits von 130 km/h einen Einfluss auf das globale Klima haben wird?',
        '');
    Question p5 = _generateQuestion('p5', 'Tut Deutschland alles in allem genug gegen den Klimawandel?', '');
    Question p6 = _generateQuestion(
        'p6', 'Denkst du, dass der Klimawandel die Lebensqualität auch in Europa stark verringern wird?', '');
    Question p7 = _generateQuestion(
        'p7',
        'Gesamtgesellschaftliche Ziele und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für die gesamtgesellschaftliche Ziele oder individuelle Freiheit entscheiden?',
        '',
        alternativeScale: ['Gesamtgesellschaftliche Ziele', 'Individuelle Freiheit']);

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5, p6, p7];
  }

  void setGrundeinkommenQuestions() {
    Question question = _generateQuestion('q0', 'Brauchen wir ein Bedingungsloses Grundeinkommen?', 'Grundeinkommen');

    // Glaubst Du, dass Menschen, die von einem bedingungslosen Grundeinkommen profitieren, sich freiwillig zum Wohle der Gesellschaft engagieren?
    // Ist Deutschland ein reiches Land?
    // Sollten wir generell mehr Maßnahmen ergreifen, um arme Menschen zu unterstützen?
    // Glaubst du, dass durch KI viele Jobs wegfallen werden?
    // Findest du, dass sich Leistung in Deutschland lohnt?
    // Sind äußere Umstände in unserer Gesellschaft maßgeblich dafür verantwortlich in welchen Lebenssituationen sich Menschen befinden?
    // Wer sollte für das Wohlergehen von Menschen in einem Land verantwortlich sein, der Staat oder das Individuum?
    //

    Question p1 = _generateQuestion(
        'p1',
        'Glaubst Du, dass Menschen, die von einem bedingungslosen Grundeinkommen profitieren, sich freiwillig zum Wohle der Gesellschaft engagieren?',
        '');
    Question p2 = _generateQuestion('p2', 'Ist Deutschland ein reiches Land?', '');
    Question p3 =
        _generateQuestion('p3', 'Sollten wir generell mehr Maßnahmen ergreifen, um arme Menschen zu unterstützen?', '');
    Question p4 = _generateQuestion('p4', 'Glaubst du, dass durch KI viele Jobs wegfallen werden?', '');
    Question p5 = _generateQuestion('p5', 'Findest du, dass sich Leistung in Deutschland lohnt?', '');
    Question p6 = _generateQuestion(
        'p6',
        'Sind äußere Umstände in unserer Gesellschaft maßgeblich dafür verantwortlich in welchen Lebenssituationen sich Menschen befinden?',
        '');
    Question p7 = _generateQuestion(
        'p7',
        'Wer sollte für das Wohlergehen von Menschen in einem Land verantwortlich sein, der Staat oder das Individuum?',
        '',
        alternativeScale: ['Staat', 'Individuum']);

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5, p6, p7];
  }

  void setCoronaMassnahmenQuestions() {
    Question question = _generateQuestion(
        'q0',
        'Findest du, dass die Medien ausgewogen über die Pandemie und die Diskussionen um die Maßnahmen berichtet haben?',
        'Corona-Maßnahmen');

    // Hattest Du den Eindruck, dass sich die Entscheidungen auf fundierten Expertenrat gestützt haben?
    // Findest du, dass die Medien ausgewogen über die Pandemie und die Diskussionen um die Maßnahmen berichtet haben?
    // Glaubst Du, dass Wirkung und Nebenwirkungen der Impfung in einem angemessenen Verhältnis standen?
    // Wurden die Kritiker der Maßnahmen und der Impfung anständig behandelt?
    // Vertraust Du grundsätzlich der deutschen Regierung?
    // Rechtfertigt das Retten eines Lebens die signifikante Verschlechterung der Lebensumstände von vielen anderen Menschen?
    // Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?

    Question p1 = _generateQuestion(
        'p1', 'Hattest Du den Eindruck, dass sich die Entscheidungen auf fundierten Expertenrat gestützt haben?', '');
    Question p2 = _generateQuestion(
        'p2',
        'Findest du, dass die Medien ausgewogen über die Pandemie und die Diskussionen um die Maßnahmen berichtet haben?',
        '');
    Question p3 = _generateQuestion(
        'p3', 'Glaubst Du, dass Wirkung und Nebenwirkungen der Impfung in einem angemessenen Verhältnis standen?', '');
    Question p4 = _generateQuestion('p4', 'Wurden die Kritiker der Maßnahmen und der Impfung anständig behandelt?', '');
    Question p5 = _generateQuestion('p5', 'Vertraust Du grundsätzlich der deutschen Regierung?', '');
    Question p6 = _generateQuestion(
        'p6',
        'Rechtfertigt das Retten eines Lebens die signifikante Verschlechterung der Lebensumstände von vielen anderen Menschen?',
        '');
    Question p7 = _generateQuestion(
        'p7',
        'Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?',
        '',
        alternativeScale: ['Soziale Gerechtigkeit', 'Individuelle Freiheit']);

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5, p6, p7];
  }

  void setZigarettenkaufAlterQuestions() {
    Question question = _generateQuestion(
        'q0',
        'In einem Gesetzentwurf in Großbritannien soll das Mindestalter für den Kauf von Zigaretten jedes Jahr angehoben werden. Wer jetzt unter 16 ist, wird somit nie legal Zigaretten kaufen dürfen. Hältst du das Gesetz für sinnvoll?',
        'Zigarettenkauf-Alter');

    // Glaubst du, dass die Regelung funktionieren und den Zigarettenkonsum stark einschränken würde?
    // Sollten generell alle Drogen verboten sein (inklusive Alkohol)?
    // Sind Nichtraucher bereits ausreichend geschützt?
    // Wer sollte für das Wohlergehen von Menschen in einem Land verantwortlich sein, der Staat oder das Individuum?
    // Ist es prinzipiell erlaubt, individuelle Freiheit einzuschränken, um Menschen zu besseren Verhaltensweisen zu bringen?
    // Ist es richtig, gewisse Regeln auf einmal zu verändern und so verschiedene Lebensrealitäten für verschiedene Generationen zu schaffen?
    // Traditionelle Werte und Verhaltensweisen sollen beibehalten/unterstützt werden.

    Question p1 = _generateQuestion(
        'p1', 'Glaubst du, dass die Regelung funktionieren und den Zigarettenkonsum stark einschränken würde?', '');
    Question p2 = _generateQuestion('p2', 'Sollten generell alle Drogen verboten sein (inklusive Alkohol)?', '');
    Question p3 = _generateQuestion('p3', 'Sind Nichtraucher bereits ausreichend geschützt', '');
    Question p4 = _generateQuestion(
        'p4',
        'Wer sollte für das Wohlergehen von Menschen in einem Land verantwortlich sein, der Staat oder das Individuum?',
        '',
        alternativeScale: ['Staat', 'Individuum']);
    Question p5 = _generateQuestion(
        'p5',
        'Ist es prinzipiell erlaubt, individuelle Freiheit einzuschränken, um Menschen zu besseren Verhaltensweisen zu bringen?',
        '');
    Question p6 = _generateQuestion(
        'p6',
        'Ist es richtig, gewisse Regeln auf einmal zu verändern und so verschiedene Lebensrealitäten für verschiedene Generationen zu schaffen?',
        '');
    Question p7 =
        _generateQuestion('p7', 'Traditionelle Werte und Verhaltensweisen sollen beibehalten/unterstützt werden.', '');

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5, p6, p7];
  }

  void setSmartphoneVerbotQuestions() {
    Question question = _generateQuestion('q0', 'Sollten Smartphones an Schulen verboten werden?', 'Smartphone-Verbot');

    // Glaubst du, dass die Regelung funktionieren und die Smartphonenutzung in der Schule stark einschränken würde?
    // Denkst Du, dass digitale Nebenwirkungen hinreichend erfasst, erforscht und kommuniziert werden?
    // Denkst Du, dass digitale Nebenwirkungen bei Kindern und Jugendlichen besonders gravierend sein können?
    // Schaden wir uns in Deutschland, wenn wir global gesehen einen digitalen Sonderweg gehen?
    // Kann die Digitalisierung die Bildung besser machen?
    // Ist es generell richtig, Kinder in manchen Fällen zu bevormunden?
    // Gesamtgesellschaftliche Ziele und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für die gesamtgesellschaftliche Ziele oder individuelle Freiheit entscheiden?

    Question p1 = _generateQuestion(
        'p1',
        'Glaubst du, dass die Regelung funktionieren und die Smartphonenutzung in der Schule stark einschränken würde?',
        '');
    Question p2 = _generateQuestion(
        'p2', 'Denkst Du, dass digitale Nebenwirkungen hinreichend erfasst, erforscht und kommuniziert werden?', '');
    Question p3 = _generateQuestion('p3',
        'Denkst Du, dass digitale Nebenwirkungen bei Kindern und Jugendlichen besonders gravierend sein können?', '');
    Question p4 = _generateQuestion(
        'p4', 'Schaden wir uns in Deutschland, wenn wir global gesehen einen digitalen Sonderweg gehen?', '');
    Question p5 = _generateQuestion('p5', 'Kann die Digitalisierung die Bildung besser machen?', '');
    Question p6 = _generateQuestion('p6', 'Ist es generell richtig, Kinder in manchen Fällen zu bevormunden?', '');
    Question p7 = _generateQuestion(
        'p7',
        'Gesamtgesellschaftliche Ziele und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für die gesamtgesellschaftliche Ziele oder individuelle Freiheit entscheiden?',
        '',
        alternativeScale: ['Gesamtgesellschaftliche Ziele', 'Individuelle Freiheit']);

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5, p6, p7];
  }

  void setAfDVerbotQuestions() {
    Question question = _generateQuestion('q0', 'Sollte die AfD verboten werden?', 'AfD-Verbot');

    // Sind rechte Parteien eine Gefahr für unsere Demokratie?
    // Hältst du eine Regierungsbeteiligung (Bund oder Länder) der AfD in den nächsten 10 Jahren für wahrscheinlich?
    // Hast Du das Europawahlprogramm der AfD gelesen?
    // Kennst Du persönlich Menschen, die in der AfD parteilich engagiert sind?
    // Kannst du die Motivation, die AfD zu wählen, nachvollziehen?
    // Hältst Du die Berichterstattung in den deutschen Medien alles in allem für glaubwürdig oder nicht glaubwürdig?
    // Ist es manchmal richtig, Demokratie einzuschränken, um Demokratie zu schützen?

    Question p1 = _generateQuestion('p1', 'Sind rechte Parteien eine Gefahr für unsere Demokratie?', '');
    Question p2 = _generateQuestion(
        'p2',
        'Hältst du eine Regierungsbeteiligung (Bund oder Länder) der AfD in den nächsten 10 Jahren für wahrscheinlich?',
        '');

    Question p3 = _generateQuestion('p3', 'Hast Du das Europawahlprogramm der AfD gelesen?', '');
    Question p4 =
        _generateQuestion('p4', 'Kennst Du persönlich Menschen, die in der AfD parteilich engagiert sind?', '');
    Question p5 = _generateQuestion('p5', 'Kannst du die Motivation, die AfD zu wählen, nachvollziehen?', '');
    Question p6 = _generateQuestion(
        'p6',
        'Hältst Du die Berichterstattung in den deutschen Medien alles in allem für glaubwürdig oder nicht glaubwürdig?',
        '');
    Question p7 =
        _generateQuestion('p7', 'Ist es manchmal richtig, Demokratie einzuschränken, um Demokratie zu schützen?', '');

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5, p6, p7];
  }

  void setRaumfahrtQuestions() {
    Question question = _generateQuestion(
        'q0',
        'Ist es sinnvoll, in die Entwicklung der Raumfahrt zu investieren, um andere Planeten zu besiedeln?',
        'Raumfahrt');

    Question p1 = _generateQuestion(
        'p1', 'Können wir es uns volkswirtschaftlich leisten, Geld in planetare Zukunftsprojekte zu stecken?', '');
    Question p2 = _generateQuestion(
        'p2', 'Findest Du universitäre, aus Steuermitteln bezahlte Grundlagenforschung sinnvoll?', '');
    Question p3 = _generateQuestion(
        'p3',
        'Findest du es realistisch, dass die in den nächsten 500 Jahren die Erschließung anderer Planeten möglich wird?',
        '');
    Question p4 = _generateQuestion(
        'p4', 'Sollten diese Entwicklungen staatlich oder privatwirtschaftlich finanziert und organisiert werden?', '',
        alternativeScale: ['Staatlich', 'Privatwirtschaftlich']);
    Question p6 = _generateQuestion('p6', 'Glaubst du, dass die Erde unbewohnbar werden wird?', '');
    Question p7 = _generateQuestion(
        'p7', 'Ist der Klimawandel noch aufzuhalten, bzw. auf ein alles in allem verkraftbares Maß beschränkbar?', '');
    Question p8 = _generateQuestion('p8', 'Ist Wachstum und Expansion prinzipiell gut?', '');

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p6, p7, p8];
  }

  void setPlastikLidQuestions() {
    // Seit Juli sind lose Deckel bei vielen Plastikflaschen verboten. Hältst Du das Gesetz für sinnvoll?
    //
    // Ist Plastikmüll in der Umwelt prinzipiell ein Problem?
    // Glaubst du, dass durch das Gesetz weniger Plastikmüll in die Umwelt gelangen wird?
    // Denkst Du, dass der Nutzen hier die Kosten der Unternehmen für die Umrüstung des Maschinenparks überwiegt?
    // Kannst Du Dir andere Maßnahmen zur Reduktion des Plastikmülls vorstellen, die ein deutlich besseres Verhältnis von Kosten zu Nutzen aufweisen würden?
    // Tut Deutschland alles in allem genug für Umweltschutz?
    // Glaubst du, dass die Maßnahme die Akzeptanz für Klima- und Umweltschutz senken wird?
    // Gesamtgesellschaftliche Ziele und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für die gesamtgesellschaftliche Ziele oder individuelle Freiheit entscheiden?
    //

    Question question = _generateQuestion(
        'q0',
        'Seit Juli sind lose Deckel bei vielen Plastikflaschen verboten. Hältst Du das Gesetz für sinnvoll?',
        'Plastikdeckel');

    Question p1 = _generateQuestion('p1', 'Ist Plastikmüll in der Umwelt prinzipiell ein Problem?', '');
    Question p2 = _generateQuestion(
        'p2', 'Glaubst du, dass durch das Gesetz weniger Plastikmüll in die Umwelt gelangen wird?', '');
    Question p3 = _generateQuestion(
        'p3',
        'Denkst Du, dass der Nutzen hier die Kosten der Unternehmen für die Umrüstung des Maschinenparks überwiegt?',
        '');
    Question p4 = _generateQuestion(
        'p4',
        'Kannst Du Dir andere Maßnahmen zur Reduktion des Plastikmülls vorstellen, die ein deutlich besseres Verhältnis von Kosten zu Nutzen aufweisen würden?',
        '');
    Question p6 = _generateQuestion('p6', 'Tut Deutschland alles in allem genug für Umweltschutz?', '');
    Question p7 = _generateQuestion(
        'p7', 'Glaubst du, dass die Maßnahme die Akzeptanz für Klima- und Umweltschutz senken wird?', '');
    Question p8 = _generateQuestion(
        'p8',
        'Gesamtgesellschaftliche Ziele und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für die gesamtgesellschaftliche Ziele oder individuelle Freiheit entscheiden?',
        '',
        alternativeScale: ['Gesamtgesellschaftliche Ziele', 'Individuelle Freiheit']);

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p6, p7, p8];
  }

  void setSelfDeterminationLaw() {
    Question question = _generateQuestion(
        'q0',
        'Findest Du es richtig, dass Menschen nach dem neuen Selbstbestimmungsgesetz unkompliziert ihren Geschlechtseintrag beim Standesamt ändern können?',
        'Selbstbestimmungsgesetz');
    // Findest Du es richtig, dass Menschen nach dem neuen Selbstbestimmungsgesetz unkompliziert ihren Geschlechtseintrag beim Standesamt ändern können?

    // Hältst Du die Unterscheidung nach zwei biologischen Geschlechtern (Mann/Frau) für sinnvoll und noch zeitgemäß?
    // Sollten unter 14- bis 18-jährige prinzipiell Änderungen zu Geschlecht und Personenstand vornehmen dürfen?
    // Sollten Erwachsene prinzipiell Änderungen zu Geschlecht und Personenstand vornehmen dürfen?
    // Sollte vor jeder Änderung immer ein fachärztliches Gutachten eingeholt werden?
    // Kann die Änderung des Geschlechtseintrags andere Personen negativ beeinflussen?
    // Kann die Änderung des Geschlechtseintrags Diskriminierung verringern?
    // Wer sollte für das Wohlergehen von Menschen in einem Land verantwortlich sein, der Staat oder das Individuum?

    Question p1 = _generateQuestion(
        'p1',
        'Hältst Du die Unterscheidung nach zwei biologischen Geschlechtern (Mann/Frau) für sinnvoll und noch zeitgemäß?',
        '');
    Question p2 = _generateQuestion(
        'p2',
        'Sollten unter 14- bis 18-jährige prinzipiell Änderungen zu Geschlecht und Personenstand vornehmen dürfen?',
        '');
    Question p3 = _generateQuestion(
        'p3', 'Sollten Erwachsene prinzipiell Änderungen zu Geschlecht und Personenstand vornehmen dürfen?', '');
    Question p4 =
        _generateQuestion('p4', 'Sollte vor jeder Änderung immer ein fachärztliches Gutachten eingeholt werden?', '');
    Question p5 =
        _generateQuestion('p5', 'Kann die Änderung des Geschlechtseintrags andere Personen negativ beeinflussen?', '');
    Question p6 = _generateQuestion('p6', 'Kann die Änderung des Geschlechtseintrags Diskriminierung verringern?', '');
    Question p7 = _generateQuestion(
        'p7',
        'Wer sollte für das Wohlergehen von Menschen in einem Land verantwortlich sein, der Staat oder das Individuum?',
        '',
        alternativeScale: ['Staat', 'Individuum']);

    QuestionNotifier().currentQuestion = question;
    QuestionNotifier().premises = [p1, p2, p3, p4, p5, p6, p7];
  }
}
