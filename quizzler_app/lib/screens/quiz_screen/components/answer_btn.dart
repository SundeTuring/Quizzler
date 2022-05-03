import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerBtn extends StatelessWidget {
  const AnswerBtn({
    required this.answerText,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                answerText,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF9EF),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
