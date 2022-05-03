import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExitAlert extends StatelessWidget {
  const ExitAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        'Are you sure you want to exit?',
        style: GoogleFonts.poppins(),
      ),
      actions: [
        ElevatedButton(
          child: Text(
            'No',
            style: GoogleFonts.poppins(
              color: Colors.black,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFFFFF9EF),
            elevation: 0,
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        ElevatedButton(
          child: Text(
            'Yes, exit',
            style: GoogleFonts.poppins(
              color: Colors.black,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFFFFC04A),
            elevation: 0,
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
