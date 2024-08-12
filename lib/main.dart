import 'package:background_experiment/home.dart';
import 'package:background_experiment/questionNotifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => QuestionNotifier()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ColorScheme getColorScheme() => ColorScheme.fromSeed(seedColor: Colors.indigo).copyWith(
        primary: Colors.indigo,
        secondary: Colors.black,
        surface: Colors.white,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black,
        onError: Colors.white,
      );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Background',
        theme: ThemeData(
          colorScheme: getColorScheme(),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
