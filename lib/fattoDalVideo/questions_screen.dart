import 'package:adv_basics/fattoDalVideo/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/fattoDalVideo/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

// Dichiarazione della classe QuestionsScreen.
// Estende StatefulWidget perché la schermata delle domande
// deve poter gestire e aggiornare il proprio stato (es. risposte selezionate).
class QuestionsScreen extends StatefulWidget {
  // Costruttore della classe QuestionsScreen.
  // Usa la sintassi delle "named parameters" (parametri nominati).
  // super.key serve per passare la chiave al costruttore della classe padre (StatefulWidget).
  // required this.onSelectAnswer significa che il parametro onSelectAnswer
  // è obbligatorio quando creiamo un oggetto QuestionsScreen.
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  // Dichiarazione di un campo (variabile) della classe.
  // onSelectAnswer è una funzione che riceve una String (la risposta scelta).
  // In pratica, questo è un "callback": QuestionsScreen non decide da solo cosa fare,
  // ma chi lo crea (il genitore, cioè Quiz) gli passa una funzione da chiamare
  // quando l'utente seleziona una risposta.
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
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
              style: GoogleFonts.nosifer(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
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
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
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
