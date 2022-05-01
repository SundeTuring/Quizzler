import 'package:flutter/material.dart';
import 'package:quizzler_app/models/questions.dart';
import 'package:quizzler_app/services/network.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key, required this.questions}) : super(key: key);

  final dynamic questions;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final questions = QuestionBrain.createQuestionsObj(widget.questions);
    for (Question question in questions) {
      
    }

    return Container();
  }
}
