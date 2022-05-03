import 'dart:convert';

import "package:http/http.dart" as http;

import '../models/questions.dart';

class QuizBrain {
  static Future<List<Question>> createQuestions(category) async {
    final data = await _fetchQuestions(category);
    List<Question> questions = [];
    for (Map question in data) {
      final mappedQuestion = Question.fromJson(question);
      questions.add(mappedQuestion);
    }
    return questions;
  }

  static Future _fetchQuestions(category) async {
    final response = await http.get(Uri.parse(
        'https://opentdb.com/api.php?amount=10&category=$category&type=multiple'));

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

class QuizConsts {
  static const List categories = [
    {
      "first_container": {
        "name": "Mythology",
        "value": 20,
      },
      "second_container": {
        "name": "Computers",
        "value": 18,
      }
    },
    {
      "first_container": {
        "name": "Film",
        "value": 11,
      },
      "second_container": {
        "name": "Books",
        "value": 10,
      }
    },
    {
      "first_container": {
        "name": "Geography",
        "value": 22,
      },
      "second_container": {
        "name": "History",
        "value": 23,
      },
    },
  ];
}
