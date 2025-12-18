// Import della libreria Flutter per i widget Material Design.
import 'package:flutter/material.dart';

// Import della libreria Google Fonts per usare font personalizzati.
import 'package:google_fonts/google_fonts.dart';

/// Widget personalizzato che rappresenta un bottone di risposta.
/// È uno StatelessWidget perché non ha stato interno:
/// riceve solo testo e una funzione da eseguire quando viene premuto.
class AnswerButton extends StatelessWidget {
  /// Costruttore con parametri obbligatori:
  /// - `answerText`: testo da mostrare sul bottone.
  /// - `onTap`: funzione da eseguire quando il bottone viene premuto.
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  /// Parametri ricevuti dal costruttore:
  final String answerText; // Testo dinamico del bottone
  final void Function() onTap; // Funzione callback al tap

  @override
  Widget build(BuildContext context) {
    /// ElevatedButton: bottone "in rilievo" con stile personalizzato.
    /// - `onPressed`: funzione da eseguire al click.
    /// - `style`: definisce colori, padding, font.
    /// - `child`: contenuto del bottone (qui un Text).
    return ElevatedButton(
      onPressed: onTap, // Quando premuto, esegue la funzione passata
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
        backgroundColor: const Color(0xFF000000), // sfondo nero
        foregroundColor: const Color.fromARGB(
          255,
          255,
          254,
          255,
        ), // testo bianco
        textStyle: GoogleFonts.creepster(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
      child: Text(
        answerText, // Mostra il testo dinamico sul bottone
        textAlign: TextAlign.center,
      ),
    );
  }
}
