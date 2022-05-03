import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:flutter/material.dart';
import 'package:quizzler_app/screens/quiz_screen/components/answer_btn.dart';
import 'package:quizzler_app/screens/quiz_screen/components/quiz_header.dart';
import 'package:quizzler_app/services/question_brain.dart';

import '../../models/questions.dart';
import 'components/exit_alert.dart';
import 'components/result_widget.dart';

// ignore: must_be_immutable
class QuestionScreen extends StatefulWidget {
  QuestionScreen({
    Key? key,
    required this.categoryNumber,
  }) : super(key: key);

  final int categoryNumber;
  Future<List<Question>>? futureQuestions;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  void initState() {
    super.initState();
    widget.futureQuestions = createQuestions();
  }

  createQuestions() {
    QuizBrain quizBrain = QuizBrain(category: widget.categoryNumber);
    return quizBrain.createQuestions();
  }

  void _giveFeedback({dynamic answer, currentQuestion}) {
    if (answer == currentQuestion.correctAnswer) {
      numberOfCorrectAnswers++;
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

  void _resetQuiz() {
    setState(() {
      currentIndex = 0;
      feedbackCircles = [];
      questionNumber = 1;
      numberOfCorrectAnswers = 0;
    });
  }

  int questionNumber = 1;
  int currentIndex = 0;
  int numberOfCorrectAnswers = 0;
  List<Widget> feedbackCircles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<Question>>(
          future: widget.futureQuestions,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final questions = snapshot.data;
              Question currentQuestion = questions![currentIndex];
              List<dynamic> allTheAnswers =
                  QuizHelper.getAllTheAnswers(currentQuestion);

              return currentIndex < questions.length - 1
                  ? WillPopScope(
                      onWillPop: () async {
                        final value = await showDialog<bool>(
                          context: context,
                          builder: (context) {
                            return const ExitAlert();
                          },
                        );
                        return value == true;
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 2,
                            child: QuizHeader(
                              questionNumber: questionNumber,
                              currentQuestion: currentQuestion,
                              feedbackCircles: feedbackCircles,
                            ),
                          ),
                          ...allTheAnswers.map((answer) {
                            HtmlUnescape unescape = HtmlUnescape();
                            return Expanded(
                              child: AnswerBtn(
                                answerText: unescape.convert(answer),
                                onTap: () {
                                  if (currentIndex < questions.length - 1) {
                                    setState(
                                      () {
                                        currentIndex++;
                                        questionNumber++;
                                        _giveFeedback(
                                          answer: answer,
                                          currentQuestion: currentQuestion,
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    )
                  : ResultWidget(
                      numberOfCorrectAnswers: numberOfCorrectAnswers,
                      replayFunctionality: _resetQuiz,
                    );
            } else {
              return const SpinKitFoldingCube(
                color: Color(0xFFFFC04A),
              );
            }
          },
        ),
      ),
    );
  }
}
