import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/dummy_data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

class ResultAnswers extends StatelessWidget {
  const ResultAnswers(this.restartQuiz,
      {super.key, required this.selectedAnswers});

  final List<String> selectedAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }

    return summary;
  }

  int getCountCorrects() {
    var summary = getSummaryData();
    var count = 0;
    summary.forEach((element) {
      if (element['correct_answer'] == element['user_answer']) {
        count++;
      }
    });
    return count;
  }

  @override
  Widget build(context) {
    final summary = getSummaryData();
    final correctAnswers = summary
        .where((element) => element['user_answer'] == element['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Você acertou $correctAnswers questões de um total de ${questions.length}!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(150, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                icon: const Icon(
                  Icons.restart_alt_outlined,
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: restartQuiz,
                label: Text(
                  'Reiniciar Quiz',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
