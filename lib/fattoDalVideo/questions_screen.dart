// Import dei file e librerie necessarie.
// - questions.dart: contiene la lista di domande e risposte.
// - answer_button.dart: widget riutilizzabile per mostrare un bottone di risposta.
// - flutter/material.dart: libreria base per UI.
// - google_fonts: per usare font personalizzati.
import 'package:adv_basics/fattoDalVideo/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/fattoDalVideo/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

/// Schermata che mostra le domande del quiz.
/// È un StatefulWidget perché deve aggiornarsi ogni volta che l’utente
/// seleziona una risposta (incrementando l’indice della domanda).
class QuestionsScreen extends StatefulWidget {
  /// Costruttore con parametro obbligatorio `onSelectAnswer`.
  /// Questo è un *callback*: il genitore (Quiz) passa una funzione
  /// che verrà chiamata ogni volta che l’utente seleziona una risposta.
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  /// Funzione che riceve la risposta scelta (String).
  /// Non decide cosa fare, ma delega al genitore.
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

/// Stato interno della schermata.
/// Qui gestiamo quale domanda mostrare e come reagire alle risposte.
class _QuestionsScreenState extends State<QuestionsScreen> {
  /// Indice della domanda corrente (parte da 0).
  var currentQuestionIndex = 0;

  /// Funzione chiamata quando l’utente seleziona una risposta.
  /// - Passa la risposta al genitore tramite `widget.onSelectAnswer`.
  /// - Incrementa l’indice per mostrare la domanda successiva.
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++; // incrementa di 1
    });
  }

  @override
  Widget build(context) {
    /// Recuperiamo la domanda corrente dalla lista `questions`.
    final currentQuestion = questions[currentQuestionIndex];

    /// SizedBox: contenitore che occupa tutta la larghezza disponibile.
    /// Dentro mettiamo un Container con margine e una Column
    /// che impila testo + bottoni verticalmente.
    return SizedBox(
      width: double.infinity, // occupa tutta la larghezza
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // centra verticalmente
          crossAxisAlignment: CrossAxisAlignment.stretch, // allunga i bottoni
          children: [
            // Testo della domanda
            Text(
              currentQuestion.text,
              style: GoogleFonts.creepster(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            /// Generazione dinamica dei bottoni di risposta.
            /// - `map()` trasforma ogni risposta in un widget AnswerButton.
            /// - `...` (spread operator) espande la lista di widget
            ///   dentro la Column.
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),

            // Esempio alternativo (commentato):
            // Creare manualmente 4 bottoni con currentQuestion.answers[0..3].
            // Con map() invece il codice è più compatto e riutilizzabile.
          ],
        ),
      ),
    );
  }
}
