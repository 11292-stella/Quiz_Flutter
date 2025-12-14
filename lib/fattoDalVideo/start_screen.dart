import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
            color: Color.fromARGB(128, 250, 250, 250),
          ),
          SizedBox(height: 80),
          const Text(
            'Benvenuti nel Quiz!',
            style: TextStyle(
              color: Colors.purpleAccent,
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
            onPressed: () {},
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
