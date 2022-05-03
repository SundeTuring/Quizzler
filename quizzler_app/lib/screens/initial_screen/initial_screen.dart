import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/initial_screen_btn.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Image.asset(
              "lib/assets/images/bonbon-boy-thinking-about-the-question.png",
              width: 300,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            const InitialScreenButton(),
          ],
        ),
      ),
    );
  }
}

