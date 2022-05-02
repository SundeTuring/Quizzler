import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzler_app/services/question_brain.dart';

import '../../../models/questions.dart';
import '../../quiz_screen/quiz_screen.dart';

class RowQuizContainers extends StatelessWidget {
  const RowQuizContainers({
    Key? key,
    required this.firstContainerText,
    required this.secondContainerText,
  }) : super(key: key);

  final String firstContainerText;
  final String secondContainerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: QuizContainer(
            text: firstContainerText,
          ),
        ),
        Expanded(
          child: QuizContainer(
            text: secondContainerText,
          ),
        ),
      ],
    );
  }
}

class QuizContainer extends StatelessWidget {
  const QuizContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          final List<Question> questions = await QuizBrain.createQuestions();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return QuestionScreen(
                  questions: questions,
                );
              },
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFF9EF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
