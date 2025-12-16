import 'package:adv_basics/fattoDalVideo/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/fattoDalVideo/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

//anche questo widget che mostrerà le domande del quiz è uno StatefulWidget,
//perchè in futuro dovrà aggiornarsi quando l'utente risponderà alle domande
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    // currentQuestionIndex = currentQuestionIndex +1;
    //currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++; //incrementa il valore di 1
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    //è un widget che serve a definire dimensioni fisse o espandibili per un contenitore.
    //Può essere usato per spazi vuoti, oppure come wrapper per altri widget, imponendo larghezza/altezza specifica.
    return SizedBox(
      //double.infinity indica che la larghezza deve essere il massimo possibile nello spazio disponibile
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          //mainAxisAlignment controlla l’allineamento lungo l’asse principale (in questo caso verticale).
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.creepster(
                textStyle: const TextStyle(color: Colors.white, fontSize: 26),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            //qui usiamo la funzione .map() per trasformare ogni elemento di una lista
            //in una nuova lista, in questo caso ogni stringa "answer" della lista currentQuestion.answers
            //viene trasformata in un Widget AnswerButton
            //map() restituisce un iterabile di widget, non una lista vera e propria.
            //Per ogni elemento della lista answers (cioè ogni risposta),
            //creiamo un nuovo AnswerButton con il testo corrispondente.
            //L'operatore "..." (spread operator):
            //Serve a "espandere" un Iterable o una lista dentro un'altra lista.
            //“spalma” il risultato di map dentro la lista dei widget, così ogni bottone diventa un figlio del Column.
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answerText: answer, onTap: answerQuestion);
            }),

            //Qui usiamo AnswerButton widget
            //quando viene premuto esegue la funzione
            // AnswerButton(
            //   answerText: currentQuestion.answers[0],
            //   onTap: () {}, // callback con logica
            // ),
            // //Secondo bottone: stesso comportamento, ma con testo diverso.
            // AnswerButton(
            //   answerText: currentQuestion.answers[1],
            //   onTap: () {}, // callback con logica
            // ),
            // // Terzo bottone: ancora un bottone riutilizzabile con testo personalizzato.
            // AnswerButton(
            //   answerText: currentQuestion.answers[2],
            //   onTap: () {}, // callback con logica
            // ),
            // AnswerButton(
            //   answerText: currentQuestion.answers[3],
            //   onTap: () {}, // callback con logica
            // ),
          ],
        ),
      ),
    );
  }
}
