import 'dart:convert';

import "package:http/http.dart" as http;

import '../models/questions.dart';
//TODO: criar lógica para alterar as perguntas dependendo do container que a pessoa clicou
class QuestionBrain {
  // Eu posso simplesmente fazer tudo isso usando uma lista com as próprias questões, esse código por fim é desnecessário e pode ser removido
  // O que eu posso fazer ao invés disso é uma lista com as questões e ir acessando a propriedade de cada uma delas, até eu simplesmente finalizar todo o quiz
  static List<Map<String, dynamic>> createQuestions() {
    final dynamic data = fetchQuestions();
    final List<Question> questionsObj = createQuestionsObj(data);

    List<Map<String, dynamic>> questions = [];
    for (Question questionObj in questionsObj) {
      final List<dynamic> allTheAnswers = questionObj.incorrectAnswers;
      allTheAnswers.add(questionObj.correctAnswer);

      Map<String, dynamic> question = {
        "question": questionObj.question,
        "correct_answer": questionObj.correctAnswer,
        "all_the_answers": allTheAnswers,
      };
      questions.add(question);
    }
    return questions;
  }

  static List<Question> createQuestionsObj(dynamic data) {
    List<Question> questions = [];
    for (Map question in data) {
      final mappedQuestion = Question.fromJson(question);
      questions.add(mappedQuestion);
    }
    return questions;
  }

  static Future fetchQuestions() async {
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
