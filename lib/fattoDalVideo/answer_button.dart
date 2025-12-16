import 'package:flutter/material.dart';

// Definiamo un widget personalizzato chiamato AnswerButton.
//Estende StatelessWidget perché non ha stato interno da gestire.
class AnswerButton extends StatelessWidget {
  //Costruttore costante con parametri obbligatori.(required)
  //'answerText' è il testo da mostrare sul bottone.
  //'onTap' è la funzione da eseguire quando il bottone viene premuto.
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  // Dichiarazione dei parametri ricevuti dal costruttore.
  final String answerText; //Testo dinamico del bottone
  final void Function() onTap; //Funzione callback al tap

  @override
  Widget build(BuildContext context) {
    // Costruiamo un ElevatedButton con comportamento e testo personalizzati.
    return ElevatedButton(
      onPressed: onTap, //Quando premuto, esegue la funzione passata
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color(0xFF000000),
        foregroundColor: const Color.fromARGB(255, 255, 254, 255),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
      child: Text(
        answerText, //Mostra il testo dinamico sul bottone
        textAlign: TextAlign.center,
      ),
    );
  }
}
