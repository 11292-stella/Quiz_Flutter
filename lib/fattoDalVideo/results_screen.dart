// Import dei file e librerie necessarie.
// - questions.dart: contiene la lista di domande e risposte.
// - questions_summary.dart: widget personalizzato che mostra un riepilogo delle domande/risposte.
// - flutter/material.dart: libreria base per UI.
import 'package:adv_basics/fattoDalVideo/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/fattoDalVideo/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

/// Schermata finale del quiz.
/// Mostra un riepilogo delle risposte date dall’utente e il punteggio ottenuto.
/// StatelessWidget perché riceve i dati già pronti (lista di risposte)
/// e li visualizza senza bisogno di stato interno.
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart,
  });

  /// Lista delle risposte scelte dall’utente, passata dal genitore (Quiz).
  final List<String> chosenAnswer;
  final void Function() onRestart;

  /// Funzione che costruisce una lista di mappe con i dati riassuntivi:
  /// - indice della domanda
  /// - testo della domanda
  /// - risposta corretta
  /// - risposta data dall’utente
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer':
            questions[i].answers[0], // convenzione: prima risposta = corretta
        'user_answer': chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // Otteniamo i dati riassuntivi.
    final summaryData = getSummaryData();

    // Numero totale di domande.
    final numTotalQuestions = questions.length;

    // Numero di risposte corrette (filtrando quelle dove user_answer == correct_answer).
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    /// Layout della schermata:
    /// - Testo con punteggio
    /// - Riepilogo dettagliato (QuestionsSummary)
    /// - Bottone per riavviare il quiz
    return SizedBox(
      width: double.infinity, // occupa tutta la larghezza disponibile
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Messaggio con punteggio finale.
            Text(
              'Hai dato $numCorrectQuestions risposte corrette su $numTotalQuestions domande!',
              style: GoogleFonts.alice(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // Widget personalizzato che mostra il riepilogo domanda per domanda.
            QuestionsSummary(summaryData),

            const SizedBox(height: 30),

            // Bottone per riavviare il quiz (callback da implementare).
            TextButton(
              onPressed: onRestart,
              child: const Text(
                'Restart quiz!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
