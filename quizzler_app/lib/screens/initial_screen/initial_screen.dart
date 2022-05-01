import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzler_app/screens/home_screen/home.dart';


class InitialScreen extends StatelessWidget {
  const InitialScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "The Quizzler app",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF313131),
            ),
          ),
          Image.asset(
            "lib/assets/images/bonbon-boy-thinking-about-the-question.png",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: SizedBox(
              width: 20,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: Text(
                  "Start the application",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: const Color(0xFF313131),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFFFC04A),
                  onPrimary: const Color(0xFF313131),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
