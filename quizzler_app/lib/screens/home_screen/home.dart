import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/question_brain.dart';
import 'components/row_quiz_containers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 35, 0),
                child: Text(
                  "Choose your quiz, and start quizzling!",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF313131),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ...QuizConsts.categories.map(
              (quizRow) {
                final String firstContainerText =
                    quizRow["first_container"]["name"];
                final int firstContainerValue =
                    quizRow["first_container"]["value"];
                final String secondContainerText =
                    quizRow["second_container"]["name"];
                final int secondContainerValue =
                    quizRow["second_container"]["value"];
                return Expanded(
                  child: RowQuizContainers(
                    firstContainerText: firstContainerText,
                    firstContainerValue: firstContainerValue,
                    secondContainerText: secondContainerText,
                    secondContainerCategoryNumber: secondContainerValue,
                  ),
                );
              },
            ),
            const Padding(padding: EdgeInsets.only(bottom: 40))
          ],
        ),
      ),
    );
  }
}
