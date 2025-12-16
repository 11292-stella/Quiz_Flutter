import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  //nel costruttore definiamo un parametro di tipo Function
  //questo ci permette di ricevere una funzione dall'esterno(in questo caso switchScreen)
  // Usando Function startQuiz, StartScreen può chiamare startQuiz()
  //void Function()  è il tipo di una funzione che non prende argomenti e non restituisce valori.
  //È come dire: “Questa variabile conterrà una funzione che fa qualcosa, ma non riceve input e non restituisce output”.
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            //per cambiare il colore dell'immagine usiamo Color come per il testo
            //in questo caso sfruttiamo il colore bianco con trasparenza per rendere l'immagine più trasparente
            //esiste anche un altro modo per rendere un'immagine trasparente contornando Il widget Image con il widget Opacity,
            //ma è meno consigliato perche rende trasparente tutto il widget, compreso lo spazio vuoto intorno all'immagine
            //e in più è meno performante
            color: Color.fromARGB(128, 250, 250, 250),
          ),
          SizedBox(height: 80),
          const Text(
            'Benvenuti nel Quiz!',
            style: TextStyle(
              color: Color.fromARGB(255, 240, 238, 241),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          //qui aggiungiamo il bottone OutlinedButton, un bottone con bordo
          //dentro il quale mettiamo un'icona con .icon
          //se aggiungiamo una icona, non accetterà più un child ma una label
          //label è una proprietà specifica per i bottoni con icona, indica il testo del bottone
          OutlinedButton.icon(
            onPressed: startQuiz,

            //Qui richiamiamo la funzione startQuiz che è stata passata come parametro al widget StartScreen.
            //Per poterla usare qui, abbiamo dovuto salvarla in una variabile final (startQuiz),
            //così da poterla riutilizzare all'interno del bottone.
            //Questo è un esempio di "callback": il bottone non sa cosa deve fare,
            //ma chiama la funzione che gli è stata fornita dal widget genitore.
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.deepOrangeAccent,
            ),
            //Icon è un widget che serve per mostrare un'icona all'interno dell'app
            //si può usare anche al di fuori di un bottone, ma è molto comune usarlo nei bottoni
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
