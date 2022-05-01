class Question {
  final String question;
  final String correctAnswer;
  final List<dynamic> incorrectAnswers;

  const Question({
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory Question.fromJson(Map<dynamic, dynamic> json) {
    return Question(
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: json['incorrect_answers'],
    );
  }
}
