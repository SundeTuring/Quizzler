import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerBtn extends StatelessWidget {
  const AnswerBtn({
    required this.answerText,
    Key? key,
  }) : super(key: key);

  final String answerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10,
      ),
      child: Container(
        width: double.infinity,
        child: Center(
          child: Text(
            answerText,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xFFFFF9EF),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
