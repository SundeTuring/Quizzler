import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzler_app/screens/quiz_screen/components/answer_btn.dart';
import 'package:quizzler_app/screens/quiz_screen/components/feedback_circle.dart';
import 'package:quizzler_app/services/question_brain.dart';

import '../../models/questions.dart';
import 'components/result_widget.dart';

//TODO: Dar feedback quando ele tentar sair
//TODO: Quando o usuário clicar em um Container ele deve conseguir acessar o quiz correspondente a ele

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key, required this.questions}) : super(key: key);

  final List<Question> questions;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _giveFeedback({dynamic answer, currentQuestion}) {
    if (answer == currentQuestion.correctAnswer) {
      feedbackCircles.add(
        const FeedbackCircle(
          color: Color(0xFF41D664),
          icon: BootstrapIcons.check,
        ),
      );
    } else {
      feedbackCircles.add(
        const FeedbackCircle(
          color: Color(0xFFFF5978),
          icon: BootstrapIcons.x,
        ),
      );
    }
  }

  HtmlUnescape unescape = HtmlUnescape();
  int questionNumber = 1;
  int currentIndex = 0;
  List<Widget> feedbackCircles = [];
  @override
  Widget build(BuildContext context) {
    Question currentQuestion = widget.questions[currentIndex];
    List<dynamic> allTheAnswers = QuizHelper.getAllTheAnswers(currentQuestion);

    return Scaffold(
      body: SafeArea(
        child: currentIndex < widget.questions.length - 1
            ? Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
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
                    ),
                  ),
                  ...allTheAnswers.map((answer) {
                    return Expanded(
                      child: AnswerBtn(
                        answerText: unescape.convert(answer),
                        onTap: () {
                          if (currentIndex < widget.questions.length - 1) {
                            setState(
                              () {
                                currentIndex++;
                                questionNumber++;
                                _giveFeedback(answer: answer, currentQuestion: currentQuestion);
                              },
                            );
                          }
                        },
                      ),
                    );
                  }).toList(),
                ],
              )
            : const ResultWidget(),
      ),
    );
  }
}
