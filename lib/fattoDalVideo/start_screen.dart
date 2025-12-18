// Import della libreria Flutter per i widget Material Design.
import 'package:flutter/material.dart';

// Import della libreria Google Fonts per usare font personalizzati.
import 'package:google_fonts/google_fonts.dart';

/// Schermata iniziale del quiz.
/// Mostra il logo, un titolo e un bottone per avviare il quiz.
/// È uno StatelessWidget perché non ha stato interno: riceve solo una funzione
/// dal genitore e la richiama quando serve.
class StartScreen extends StatelessWidget {
  /// Costruttore: riceve una funzione `startQuiz` dal widget genitore.
  /// - `void Function()` significa: funzione che non prende parametri
  ///   e non restituisce valori.
  /// - Questo è un esempio di *callback*: StartScreen non sa cosa deve fare,
  ///   ma chiama la funzione che gli viene passata.
  const StartScreen(this.startQuiz, {super.key});

  /// Variabile che contiene la funzione passata dal genitore.
  /// Viene usata quando l’utente preme il bottone "Start Quiz".
  final void Function() startQuiz;

  @override
  Widget build(context) {
    // Center: centra il contenuto nello schermo.
    // Column: impila i widget verticalmente.
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // occupa solo lo spazio necessario
        children: [
          // Logo del quiz (immagine locale).
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            // Color: applica un filtro colore sull’immagine.
            // Qui usiamo bianco semi-trasparente per rendere il logo più "ghostly".
            // Alternativa: widget Opacity, ma meno performante.
            color: const Color.fromARGB(128, 250, 250, 250),
          ),

          const SizedBox(height: 80), // Spazio verticale tra logo e testo.
          // Titolo del quiz.
          Text(
            'Benvenuti nel Quiz!',
            style: GoogleFonts.creepster(
              color: const Color.fromARGB(255, 240, 238, 241),
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 30), // Spazio tra titolo e bottone.
          // Bottone con bordo e icona.
          OutlinedButton.icon(
            // Quando viene premuto, richiama la funzione `startQuiz`.
            onPressed: startQuiz,

            // Stile del bottone: colore, bordo, padding, testo.
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 130, 11, 11),
              backgroundColor: const Color.fromARGB(
                77,
                0,
                0,
                0,
              ), // colore testo/icona
              side: const BorderSide(
                color: Color.fromARGB(255, 242, 100, 12), // bordo arancione
                width: 3,
              ),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 36),
              textStyle: GoogleFonts.creepster(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),

            // Icona a destra del testo.
            icon: const Icon(
              Icons.play_arrow_rounded,
              size: 28,
              color: Colors.white,
            ),

            // Testo del bottone con font personalizzato.
            label: Text(
              'Start Quiz',
              style: GoogleFonts.creepster(
                textStyle: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
