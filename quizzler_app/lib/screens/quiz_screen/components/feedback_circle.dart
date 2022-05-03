import 'package:flutter/material.dart';

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
