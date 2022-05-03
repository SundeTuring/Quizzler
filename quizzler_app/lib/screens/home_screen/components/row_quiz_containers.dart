import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzler_app/services/question_brain.dart';

import '../../../models/questions.dart';
import '../../quiz_screen/quiz_screen.dart';

class RowQuizContainers extends StatelessWidget {
  const RowQuizContainers({
    Key? key,
    required this.firstContainerText,
    required this.firstContainerValue,
    required this.secondContainerText,
    required this.secondContainerCategoryNumber,
  }) : super(key: key);

  final String firstContainerText;
  final int firstContainerValue;
  final String secondContainerText;
  final int secondContainerCategoryNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: QuizContainer(
            text: firstContainerText,
            categoryNumber: firstContainerValue,
          ),
        ),
        Expanded(
          child: QuizContainer(
            text: secondContainerText,
            categoryNumber: secondContainerCategoryNumber,
          ),
        ),
      ],
    );
  }
}

class QuizContainer extends StatelessWidget {
  const QuizContainer({
    Key? key,
    required this.categoryNumber,
    required this.text,
  }) : super(key: key);

  final String text;
  final int categoryNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          final List<Question> questions = await QuizBrain.createQuestions(categoryNumber);
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
