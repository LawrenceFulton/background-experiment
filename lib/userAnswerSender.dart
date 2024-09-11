import 'package:background_experiment/enum/app_variant.dart';
import 'package:background_experiment/question.dart';
import 'package:background_experiment/questionAnswerPair.dart';
import 'package:background_experiment/questionNotifier.dart';
import 'package:background_experiment/service/variant_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class UserAnswerSender {
  CollectionReference<Map<String, dynamic>> get _chatCollection {
    final AppVariant variant = VariantService().variant;
    return FirebaseFirestore.instance.collection('chat-${variant.name}');
  }

  Future<int> addUserAnswer(Map<String, int> userAnswers, String chatIdentifier, Question question) async {
    final premises = QuestionNotifier().premises;

    final collectionRef = _chatCollection.doc(chatIdentifier);
    //make a list of all the user answers and then add them to the collection with the user ID as the document ID
    final List<Map<String, dynamic>> userAnswersList = [];
    userAnswers.forEach((questionID, answerValue) {
      final questionText = premises.firstWhereOrNull((element) => element.questionID == questionID)?.text ?? '';
      final alternativeScale =
          premises.firstWhereOrNull((element) => element.questionID == questionID)?.alternativeScale;
      userAnswersList.add({
        'questionID': questionID,
        'questionText': questionText,
        'alternativeScale': alternativeScale,
        'answerValue': answerValue,
      });
    });

    var userID = 0;
    final docSnapshot = await collectionRef.get();
    if (docSnapshot.exists) {
      final data = docSnapshot.data();
      if (data != null) {
        if (data.containsKey('0')) {
          userID = 1;
        }
        if (data.containsKey('1') && data.containsKey('0')) {
          showToast(
            'Es sind bereits zwei Personen in diesem Chat. Bitte setzen Sie eine andere Chat Identifikation ein.',
            position: ToastPosition.bottom,
            backgroundColor: Colors.red,
          );
          return -1;
        }
      }
    }

    try {
      await collectionRef.set({
        'questionTitle': question.headline,
        'questionText': question.text,
        userID.toString(): userAnswersList,
      }, SetOptions(merge: true));
      return userID;
    } catch (e) {
      showToast(
        'Ein Fehler ist aufgetreten. Bitte versuchen Sie es erneut oder Fragen Sie bei uns nach.',
        position: ToastPosition.bottom,
        backgroundColor: Colors.red,
      );

      print('Error adding user answers: $e');
      return 0;
    }
  }

  Future<List<QuestionAnswerPair>> getUserAnswers(String chatIdentifier, String otherUserID) async {
    final collectionRef = _chatCollection.doc(chatIdentifier);
    final docSnapshot = await collectionRef.get();
    if (docSnapshot.exists) {
      final data = docSnapshot.data();
      if (data != null) {
        if (data.containsKey(otherUserID)) {
          final List<Map<String, dynamic>> firestoreData = List<Map<String, dynamic>>.from(data[otherUserID]);
          return firestoreData
              .map((item) => QuestionAnswerPair(
                    question: item['questionID'].toString(),
                    answer: int.tryParse(item['answerValue'].toString()) ?? 0,
                  ))
              .toList();
        }
      }
    }
    return [];
  }

  Stream<List<QuestionAnswerPair>> getUserAnswersStream(String chatIdentifier, String otherUserID) {
    final collectionRef = _chatCollection.doc(chatIdentifier);

    return collectionRef.snapshots().map((docSnapshot) {
      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        if (data != null && data.containsKey(otherUserID)) {
          final List<Map<String, dynamic>> firestoreData = List<Map<String, dynamic>>.from(data[otherUserID]);
          return firestoreData
              .map((item) => QuestionAnswerPair(
                    question: item['questionID'].toString(),
                    answer: int.tryParse(item['answerValue'].toString()) ?? 0,
                  ))
              .toList();
        }
      }
      return [];
    });
  }
}
