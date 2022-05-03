import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home_screen/home.dart';

class InitialScreenButton extends StatelessWidget {
  const InitialScreenButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      ),
      child: SizedBox(
        width: double.infinity,
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
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
