import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/row_quiz_containers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
            const Expanded(
              child: RowQuizContainers(
                firstContainerText: "Mythology",
                secondContainerText: "Computers",
              ),
            ),
            const Expanded(
              child: RowQuizContainers(
                firstContainerText: "Film",
                secondContainerText: "Books",
              ),
            ),
            const Expanded(
              child: RowQuizContainers(
                firstContainerText: "Geography",
                secondContainerText: "History",
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 40))
          ],
        ),
      ),
    );
  }
}
