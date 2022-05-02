import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzler_app/screens/quiz_screen/components/answer_btn.dart';
import 'package:quizzler_app/services/question_brain.dart';

import '../../models/questions.dart';

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

  int questionNumber = 1;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Question currentQuestion = widget.questions[currentIndex];
    List<dynamic> allTheAnswers = QuizHelper.getAllTheAnswers(currentQuestion);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 20,
                ),
                child: Text(
                  "$questionNumber. ${currentQuestion.question}",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF313131),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            ...allTheAnswers.map((answer) {
              return Expanded(
                child: AnswerBtn(
                  answerText: answer,
                  onTap: () {
                    setState(() {
                      currentIndex++;
                      questionNumber++;
                    });
                  },
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
