import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    required this.numberOfCorrectAnswers,
    required this.replayFunctionality,
    Key? key,
  }) : super(key: key);

  final int numberOfCorrectAnswers;
  final VoidCallback replayFunctionality;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            "Congratulations!",
            style: GoogleFonts.poppins(
              color: const Color(0xFF313131),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              "You have answered $numberOfCorrectAnswers questions correctly",
              style: GoogleFonts.poppins(
                color: const Color(0xFF313131),
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          ResultButton(
            color: const Color(0xFFFFC04A),
            text: "Go back to home screen",
            onTap: () => Navigator.pop(context),
          ),
          ResultButton(
            color: const Color(0xFFFFF9EF),
            text: "Replay this quiz",
            onTap: replayFunctionality,
          ),
        ],
      ),
    );
  }
}

class ResultButton extends StatelessWidget {
  const ResultButton({
    required this.color,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 20,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            primary: color,
            onPrimary: Colors.black,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
