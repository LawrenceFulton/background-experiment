import 'dart:html' as html;

import 'package:background_experiment/compareQuestion.dart';
import 'package:background_experiment/home.dart';
import 'package:background_experiment/questionNotifier.dart';
import 'package:background_experiment/service/variant_service.dart';
import 'package:background_experiment/waitingPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'new.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final variantService = VariantService();
  final url = html.window.location.href;
  variantService.setVariantFromUrl(url);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => QuestionNotifier()),
      ChangeNotifierProvider(create: (context) => VariantService()),
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

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Background',
        theme: ThemeData(
          colorScheme: getColorScheme(),
          useMaterial3: true,
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => const Home(),
          '/new': (context) => const NewQuestions(),
          '/waiting': (context) => const WaitingPage(),
          '/compare': (context) => const ComparePremises(),
        },
      ),
    );
  }
}
