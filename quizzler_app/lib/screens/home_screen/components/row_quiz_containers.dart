import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../quiz_screen/quiz_screen.dart';

class RowQuizContainers extends StatelessWidget {
  const RowQuizContainers({
    Key? key,
    required this.firstContainerText,
    required this.firstContainerValue,
    required this.secondContainerText,
    required this.secondContainerValue,
  }) : super(key: key);

  final String firstContainerText;
  final int firstContainerValue;
  final String secondContainerText;
  final int secondContainerValue;

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
            categoryNumber: secondContainerValue,
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return QuestionScreen(
                  categoryNumber: categoryNumber,
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
