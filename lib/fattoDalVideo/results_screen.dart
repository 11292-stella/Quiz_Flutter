import 'package:adv_basics/fattoDalVideo/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/fattoDalVideo/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswer});

  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //double.infinity indica che la larghezza deve essere il massimo possibile nello spazio disponibile
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 30),
            const Text('Lista delle domande e delle risposte'),
            TextButton(onPressed: () {}, child: Text('Restart quiz!')),
          ],
        ),
      ),
    );
  }
}
