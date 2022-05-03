import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_unescape/html_unescape.dart';

import '../../../models/questions.dart';

class QuizHeader extends StatelessWidget {
  const QuizHeader({
    Key? key,
    required this.questionNumber,
    required this.currentQuestion,
    required this.feedbackCircles,
  }) : super(key: key);

  final int questionNumber;
  final Question currentQuestion;
  final List<Widget> feedbackCircles;

  @override
  Widget build(BuildContext context) {
    HtmlUnescape unescape = HtmlUnescape();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "$questionNumber. ${unescape.convert(currentQuestion.question)}",
            style: GoogleFonts.poppins(
              color: const Color(0xFF313131),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Flexible(
            child: Row(
              children: [
                ...feedbackCircles,
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FeedbackCircle extends StatelessWidget {
  const FeedbackCircle({
    Key? key,
    required this.color,
    required this.icon,
  }) : super(key: key);

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: CircleAvatar(
        backgroundColor: color,
        child: Icon(
          icon,
          color: const Color(0xFF353535),
        ),
      ),
    );
  }
}
