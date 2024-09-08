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

  void _setQuestions(String mainQuestionID, String mainQuestionText, String mainQuestionHeadline,
      List<Map<String, dynamic>> premises) {
    final Question mainQuestion = _generateQuestion(mainQuestionID, mainQuestionText, mainQuestionHeadline);
    print("mainQuestion: $mainQuestion");
    final List<Question> premiseQuestions = premises.map((premise) {
      return _generateQuestion(
        premise['id'],
        premise['text'],
        '',
        alternativeScale: premise['alternativeScale'],
      );
    }).toList();

    QuestionNotifier().currentQuestion = mainQuestion;
    QuestionNotifier().premises = premiseQuestions;
  }

  void setErbschaftssteuerQuestions() {
    _setQuestions(
      'q0',
      'Bist du der Meinung, dass der Steuersatz auf Erbschaften in Deutschland zu niedrig ist?',
      'Erbschaftssteuer',
      [
        {'id': 'p1', 'text': 'Ist die wirtschaftliche Ungleichheit in Deutschland zu groß?'},
        {
          'id': 'p2',
          'text':
              'Ist eine Gleichbehandlung kleiner und großer Vermögen bei der Erbfolge aus Gerechtigkeitsgründen geboten?'
        },
        {'id': 'p3', 'text': 'Siehst Du das in Unternehmen gebundene Vermögen als besonders schutzwürdig an?'},
        {
          'id': 'p4',
          'text':
              'Ganz grundsätzlich, ist es für eine Gesellschaft negativ oder positiv, dass Menschen Wohlstand besitzen können, den sie sich selbst nicht erarbeitet haben?',
          'alternativeScale': ['Negativ', 'Positiv']
        },
        {
          'id': 'p5',
          'text': 'Soll die Verteilung von Einkommen und Vermögen prinzipiell durch Besteuerung beeinflusst werden?'
        },
        {'id': 'p6', 'text': 'Vom Tellerwäscher zum Millionär - ist das in Deutschland ein relevantes Szenario?'},
        {
          'id': 'p7',
          'text':
              'Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?',
          'alternativeScale': ['Soziale Gerechtigkeit', 'Individuelle Freiheit']
        },
      ],
    );
  }

  void setFrauenquoteQuestions() {
    _setQuestions(
      'q0',
      'Brauchen wir eine gesetzlich festgeschriebene Frauenquote für Führungspositionen?',
      'Frauenquote',
      [
        {
          'id': 'p1',
          'text':
              'Glaubst Du, dass durch mehr Frauen in Führungspositionen ein positiver Effekt für die gesamte Gesellschaft entstehen würde?'
        },
        {
          'id': 'p2',
          'text':
              'Gäbe es noch nicht ausgeschöpfte, andere Maßnahmen, um Frauen den Aufstieg in Führungspositionen zu erleichtern?'
        },
        {
          'id': 'p3',
          'text': 'Wer hat in unserer Gesellschaft mehr Vorteile – Männer oder Frauen?',
          'alternativeScale': ['Männer', 'Frauen']
        },
        {
          'id': 'p4',
          'text':
              'Sind Unterschiede zwischen Jungen und Mädchen in der Gesellschaft (Berufswunsch, Hobbies, Schulnoten etc.) eher auf biologische oder eher auf soziale Faktoren zurückzuführen?',
          'alternativeScale': ['Biologische Faktoren', 'Soziale Faktoren']
        },
        {
          'id': 'p5',
          'text':
              'Wer sollte für das Wohlergehen von Menschen in einem Land verantwortlich sein, der Staat oder das Individuum?',
          'alternativeScale': ['Staat', 'Individuum']
        },
        {
          'id': 'p6',
          'text':
              'Sind äußere Umstände in unserer Gesellschaft maßgeblich dafür verantwortlich in welchen Lebenssituationen sich Menschen befinden?'
        },
        {
          'id': 'p7',
          'text':
              'Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?',
          'alternativeScale': ['Soziale Gerechtigkeit', 'Individuelle Freiheit']
        },
      ],
    );
  }

  void setDebattenkulturQuestions() {
    _setQuestions(
      'q0',
      'Ist die Debattenkultur in Deutschland schlechter geworden?',
      'Debattenkultur',
      [
        {
          'id': 'p1',
          'text':
              'Hast du das Gefühl, dass man heute in Deutschland seine politische Meinung frei sagen kann, oder ist es besser, vorsichtig zu sein?',
          'alternativeScale': ['Frei', 'Vorsichtig']
        },
        {
          'id': 'p2',
          'text':
              'Bist du mit der Art und Weise, wie die Demokratie in Deutschland funktioniert, alles in allem gesehen zufrieden?'
        },
        {
          'id': 'p3',
          'text':
              'Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Sie die Wahl hätten, würden Sie sich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?',
          'alternativeScale': ['Soziale Gerechtigkeit', 'Individuelle Freiheit']
        },
        {'id': 'p4', 'text': 'Ist die “Cancel Culture” ein Problem?'},
        {'id': 'p5', 'text': 'Findest du, dass Social Media die Debattenkultur verschlechtert haben?'},
      ],
    );
  }

  void setAnanasQuestions() {
    _setQuestions(
      'q0',
      'Sollte Ananas auf Pizza verboten werden?',
      'Ananas',
      [
        {'id': 'p1', 'text': 'Sollte Pizza generell verboten werden?'},
        {'id': 'p2', 'text': 'Ist süß besser als salzig?'},
        {'id': 'p3', 'text': 'Ist Fusion-Küche prinzipiell ein guter Ansatz?'},
        {'id': 'p4', 'text': 'Ist regelmäßig neues Essen zu probieren wichtig?'},
        {'id': 'p5', 'text': 'Bedeutet schlechtes Essen kulturellen Verfall?'},
      ],
    );
  }

  void setWaffenlieferungenQuestions() {
    _setQuestions(
      'q0',
      'Sollte Deutschland mehr Waffen an die Ukraine liefern?',
      'Waffenlieferungen',
      [
        {'id': 'p1', 'text': 'Findest du, dass der Westen Mitschuld an dem Krieg in der Ukraine hat?'},
        {
          'id': 'p2',
          'text':
              'Denkst du es besteht die Möglichkeit, dass Russland, wenn die Ukraine verlieren würde, Nato-Staaten angreifen könnte?'
        },
        {
          'id': 'p3',
          'text':
              'Befürchtest Du, dass ein Russland, das im Krieg zu verlieren droht, seine Atomwaffen zum Einsatz bringen würde?'
        },
        {
          'id': 'p4',
          'text': 'Glaubst Du, dass der Krieg in der Ukraine mit militärischen Mitteln beendet werden kann?'
        },
        {
          'id': 'p5',
          'text':
              'Ist Deutschland wirtschaftlich stark genug, sowohl in die Bundeswehr zu investieren als auch einen großen Beitrag zur militärischen Unterstützung der Ukraine zu leisten?'
        },
        {'id': 'p6', 'text': 'Ist eine NATO-Mitgliedschaft der Ukraine im deutschen Interesse?'},
        {
          'id': 'p7',
          'text':
              'Findest du, dass ein Staat sich primär um seine eigenen Bürger kümmern sollte, auch wenn dies Nachteile für andere Menschen bedeuten würde?'
        },
      ],
    );
  }

  void setTempolimitQuestions() {
    _setQuestions(
      'q0',
      'Brauchen wir ein Tempolimit von 130 km/h auf der Autobahn?',
      'Tempolimit',
      [
        {'id': 'p1', 'text': 'Denkst Du, dass ein Tempolimit von 130 km/h die Unfallgefahr signifikant senkt?'},
        {'id': 'p2', 'text': 'Findest Du, dass das Unfallrisiko auf der Autobahn derzeit zu hoch ist?'},
        {'id': 'p3', 'text': 'Stehst Du dem Fortbewegungsmittel “PKW” grundsätzlich positiv gegenüber?'},
        {
          'id': 'p4',
          'text':
              'Gehst Du davon aus, dass die Einführung eines Tempolimits von 130 km/h einen Einfluss auf das globale Klima haben wird?'
        },
        {'id': 'p5', 'text': 'Tut Deutschland alles in allem genug gegen den Klimawandel?'},
        {
          'id': 'p6',
          'text': 'Denkst du, dass der Klimawandel die Lebensqualität auch in Europa stark verringern wird?'
        },
        {
          'id': 'p7',
          'text':
              'Gesamtgesellschaftliche Ziele und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für gesamtgesellschaftliche Ziele oder individuelle Freiheit entscheiden?',
          'alternativeScale': ['Gesamtgesellschaftliche Ziele', 'Individuelle Freiheit']
        },
      ],
    );
  }

  void setGrundeinkommenQuestions() {
    _setQuestions(
      'q0',
      'Brauchen wir ein Bedingungsloses Grundeinkommen?',
      'Grundeinkommen',
      [
        {
          'id': 'p1',
          'text':
              'Glaubst Du, dass Menschen, die von einem bedingungslosen Grundeinkommen profitieren, sich freiwillig zum Wohle der Gesellschaft engagieren?'
        },
        {'id': 'p2', 'text': 'Ist Deutschland ein reiches Land?'},
        {'id': 'p3', 'text': 'Sollten wir generell mehr Maßnahmen ergreifen, um arme Menschen zu unterstützen?'},
        {'id': 'p4', 'text': 'Glaubst du, dass durch KI viele Jobs wegfallen werden?'},
        {'id': 'p5', 'text': 'Findest du, dass sich Leistung in Deutschland lohnt?'},
        {
          'id': 'p6',
          'text':
              'Sind äußere Umstände in unserer Gesellschaft maßgeblich dafür verantwortlich in welchen Lebenssituationen sich Menschen befinden?'
        },
        {
          'id': 'p7',
          'text':
              'Wer sollte für das Wohlergehen von Menschen in einem Land verantwortlich sein, der Staat oder das Individuum?',
          'alternativeScale': ['Staat', 'Individuum']
        },
      ],
    );
  }

  void setCoronaMassnahmenQuestions() {
    _setQuestions(
      'q0',
      'Waren die Maßnahmen gegen das Corona-Virus im Großen und Ganzen sinnvoll?',
      'Corona-Maßnahmen',
      [
        {
          'id': 'p1',
          'text': 'Hattest Du den Eindruck, dass sich die Entscheidungen auf fundierten Expertenrat gestützt haben?'
        },
        {
          'id': 'p2',
          'text':
              'Findest du, dass die Medien ausgewogen über die Pandemie und die Diskussionen um die Maßnahmen berichtet haben?'
        },
        {
          'id': 'p3',
          'text': 'Glaubst Du, dass Wirkung und Nebenwirkungen der Impfung in einem angemessenen Verhältnis standen?'
        },
        {'id': 'p4', 'text': 'Wurden die Kritiker der Maßnahmen und der Impfung anständig behandelt?'},
        {'id': 'p5', 'text': 'Vertraust Du grundsätzlich der deutschen Regierung?'},
        {
          'id': 'p6',
          'text':
              'Rechtfertigt das Retten eines Lebens die signifikante Verschlechterung der Lebensumstände von vielen anderen Menschen?'
        },
        {
          'id': 'p7',
          'text':
              'Soziale Gerechtigkeit und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für soziale Gerechtigkeit oder individuelle Freiheit entscheiden?',
          'alternativeScale': ['Soziale Gerechtigkeit', 'Individuelle Freiheit']
        },
      ],
    );
  }

  void setZigarettenkaufAlterQuestions() {
    _setQuestions(
      'q0',
      'In einem Gesetzentwurf in Großbritannien soll das Mindestalter für den Kauf von Zigaretten jedes Jahr angehoben werden. Wer jetzt unter 16 ist, wird somit nie legal Zigaretten kaufen dürfen. Hältst du das Gesetz für sinnvoll?',
      'Zigarettenkauf-Alter',
      [
        {
          'id': 'p1',
          'text': 'Glaubst du, dass die Regelung funktionieren und den Zigarettenkonsum stark einschränken würde?'
        },
        {'id': 'p2', 'text': 'Sollten generell alle Drogen verboten sein (inklusive Alkohol)?'},
        {'id': 'p3', 'text': 'Sind Nichtraucher bereits ausreichend geschützt?'},
        {
          'id': 'p4',
          'text':
              'Wer sollte für das Wohlergehen von Menschen in einem Land verantwortlich sein, der Staat oder das Individuum?',
          'alternativeScale': ['Staat', 'Individuum']
        },
        {
          'id': 'p5',
          'text':
              'Ist es prinzipiell erlaubt, individuelle Freiheit einzuschränken, um Menschen zu besseren Verhaltensweisen zu bringen?'
        },
        {
          'id': 'p6',
          'text':
              'Ist es richtig, gewisse Regeln auf einmal zu verändern und so verschiedene Lebensrealitäten für verschiedene Generationen zu schaffen?'
        },
        {'id': 'p7', 'text': 'Traditionelle Werte und Verhaltensweisen sollen beibehalten/unterstützt werden.'},
      ],
    );
  }

  void setSmartphoneVerbotQuestions() {
    _setQuestions(
      'q0',
      'Sollten Smartphones an Schulen verboten werden?',
      'Smartphone-Verbot',
      [
        {
          'id': 'p1',
          'text':
              'Glaubst du, dass die Regelung funktionieren und die Smartphonenutzung in der Schule stark einschränken würde?'
        },
        {
          'id': 'p2',
          'text': 'Denkst Du, dass digitale Nebenwirkungen hinreichend erfasst, erforscht und kommuniziert werden?'
        },
        {
          'id': 'p3',
          'text':
              'Denkst Du, dass digitale Nebenwirkungen bei Kindern und Jugendlichen besonders gravierend sein können?'
        },
        {
          'id': 'p4',
          'text': 'Schaden wir uns in Deutschland, wenn wir global gesehen einen digitalen Sonderweg gehen?'
        },
        {'id': 'p5', 'text': 'Kann die Digitalisierung die Bildung besser machen?'},
        {'id': 'p6', 'text': 'Ist es generell richtig, Kinder in manchen Fällen zu bevormunden?'},
        {
          'id': 'p7',
          'text':
              'Gesamtgesellschaftliche Ziele und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für gesamtgesellschaftliche Ziele oder individuelle Freiheit entscheiden?',
          'alternativeScale': ['Gesamtgesellschaftliche Ziele', 'Individuelle Freiheit']
        },
      ],
    );
  }

  void setAfDVerbotQuestions() {
    _setQuestions(
      'q0',
      'Sollte die AfD verboten werden?',
      'AfD-Verbot',
      [
        {'id': 'p1', 'text': 'Sind rechte Parteien eine Gefahr für unsere Demokratie?'},
        {
          'id': 'p2',
          'text':
              'Hältst du eine Regierungsbeteiligung (Bund oder Länder) der AfD in den nächsten 10 Jahren für wahrscheinlich?'
        },
        {'id': 'p3', 'text': 'Hast Du das Europawahlprogramm der AfD gelesen?'},
        {'id': 'p4', 'text': 'Kennst Du persönlich Menschen, die in der AfD parteilich engagiert sind?'},
        {'id': 'p5', 'text': 'Kannst du die Motivation, die AfD zu wählen, nachvollziehen?'},
        {
          'id': 'p6',
          'text':
              'Hältst Du die Berichterstattung in den deutschen Medien alles in allem für glaubwürdig oder nicht glaubwürdig?'
        },
        {'id': 'p7', 'text': 'Ist es manchmal richtig, Demokratie einzuschränken, um Demokratie zu schützen?'},
      ],
    );
  }

  void setRaumfahrtQuestions() {
    _setQuestions(
      'q0',
      'Ist es sinnvoll, in die Entwicklung der Raumfahrt zu investieren, um andere Planeten zu besiedeln?',
      'Raumfahrt',
      [
        {
          'id': 'p1',
          'text': 'Können wir es uns volkswirtschaftlich leisten, Geld in planetare Zukunftsprojekte zu stecken?'
        },
        {'id': 'p2', 'text': 'Findest Du universitäre, aus Steuermitteln bezahlte Grundlagenforschung sinnvoll?'},
        {
          'id': 'p3',
          'text':
              'Findest Du es realistisch, dass in den nächsten 500 Jahren die Erschließung anderer Planeten möglich wird?'
        },
        {
          'id': 'p4',
          'text': 'Sollten diese Entwicklungen staatlich oder privatwirtschaftlich finanziert und organisiert werden?',
          'alternativeScale': ['Staatlich', 'Privatwirtschaftlich']
        },
        {'id': 'p6', 'text': 'Glaubst du, dass die Erde unbewohnbar werden wird?'},
        {
          'id': 'p7',
          'text': 'Ist der Klimawandel noch aufzuhalten, bzw. auf ein alles in allem verkraftbares Maß beschränkbar?'
        },
        {'id': 'p8', 'text': 'Ist Wachstum und Expansion prinzipiell gut?'},
      ],
    );
  }

  void setPlastikLidQuestions() {
    _setQuestions(
      'q0',
      'Seit Juli sind lose Deckel bei vielen Plastikflaschen verboten. Hältst Du das Gesetz für sinnvoll?',
      'Plastikdeckel',
      [
        {'id': 'p1', 'text': 'Ist Plastikmüll in der Umwelt prinzipiell ein Problem?'},
        {'id': 'p2', 'text': 'Glaubst du, dass durch das Gesetz weniger Plastikmüll in die Umwelt gelangen wird?'},
        {
          'id': 'p3',
          'text':
              'Denkst Du, dass der Nutzen hier die Kosten der Unternehmen für die Umrüstung des Maschinenparks überwiegt?'
        },
        {
          'id': 'p4',
          'text':
              'Kannst Du Dir andere Maßnahmen zur Reduktion des Plastikmülls vorstellen, die ein deutlich besseres Verhältnis von Kosten zu Nutzen aufweisen würden?'
        },
        {'id': 'p6', 'text': 'Tut Deutschland alles in allem genug für Umweltschutz?'},
        {'id': 'p7', 'text': 'Glaubst Du, dass die Maßnahme die Akzeptanz für Klima- und Umweltschutz senken wird?'},
        {
          'id': 'p8',
          'text':
              'Gesamtgesellschaftliche Ziele und individuelle Freiheit können sich gegenseitig einschränken. Wenn Du die Wahl hättest, würdest Du Dich im Zweifelsfall eher für die gesamtgesellschaftliche Ziele oder individuelle Freiheit entscheiden?',
          'alternativeScale': ['Gesamtgesellschaftliche Ziele', 'Individuelle Freiheit']
        },
      ],
    );
  }

  void setSelfDeterminationLaw() {
    _setQuestions(
      'q0',
      'Findest Du es richtig, dass Menschen nach dem neuen Selbstbestimmungsgesetz unkompliziert ihren Geschlechtseintrag beim Standesamt ändern können?',
      'Selbstbestimmungsgesetz',
      [
        {
          'id': 'p1',
          'text':
              'Hältst Du die Unterscheidung in zwei biologische Geschlechter (Mann/Frau) für sinnvoll und noch zeitgemäß?'
        },
        {
          'id': 'p2',
          'text': 'Sollten 14- bis 18-jährige prinzipiell Änderungen zu Geschlecht und Personenstand vornehmen dürfen?'
        },
        {
          'id': 'p3',
          'text': 'Sollten Erwachsene prinzipiell Änderungen zu Geschlecht und Personenstand vornehmen dürfen?'
        },
        {'id': 'p4', 'text': 'Sollte vor jeder Änderung immer ein fachärztliches Gutachten eingeholt werden?'},
        {'id': 'p5', 'text': 'Kann die Änderung des Geschlechtseintrags andere Personen negativ beeinflussen?'},
        {'id': 'p6', 'text': 'Kann die Änderung des Geschlechtseintrags Diskriminierung verringern?'},
        {
          'id': 'p7',
          'text':
              'Wer sollte für das Wohlergehen von Menschen in einem Land verantwortlich sein, der Staat oder das Individuum?',
          'alternativeScale': ['Staat', 'Individuum']
        },
      ],
    );
  }
}
