import 'dart:convert';

import "package:http/http.dart" as http;

import '../models/questions.dart';

class QuizBrain {
  static Future<List<Question>> createQuestions() async {
    final data = await _fetchQuestions();
    List<Question> questions = [];
    for (Map question in data) {
      final mappedQuestion = Question.fromJson(question);
      questions.add(mappedQuestion);
    }
    return questions;
  }

  static Future _fetchQuestions() async {
    final response = await http.get(Uri.parse(
        'https://opentdb.com/api.php?amount=10&category=18&type=multiple'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["results"];
      return data;
    } else {
      throw Exception("Failed to load question");
    }
  }
}

class QuizHelper {
  static List<dynamic> getAllTheAnswers(currentQuestion) {
    List<dynamic> allTheAnswers = currentQuestion.incorrectAnswers;
    allTheAnswers.add(currentQuestion.correctAnswer);
    allTheAnswers.shuffle();

    return allTheAnswers;
  }
}
