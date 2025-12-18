// Import principale del pacchetto Flutter: contiene tutti i widget di base
// (MaterialApp, Scaffold, Text, ecc.) necessari per costruire l'interfaccia.
import 'package:flutter/material.dart';

// Import del file quiz.dart che si trova nella cartella fattoDalVideo.
// Qui dentro è definita la classe Quiz, cioè il widget radice della tua app.
import 'package:adv_basics/fattoDalVideo/quiz.dart';

// Funzione main: è il punto di ingresso di ogni programma Dart/Flutter.
// Viene eseguita per prima quando avvii l'app.
void main() {
  // runApp: funzione di Flutter che "monta" il widget passato come argomento
  // e lo rende visibile sullo schermo del dispositivo.
  // In questo caso, il widget radice è Quiz (definito in quiz.dart).
  // 'const' indica che l'istanza è immutabile e può essere ottimizzata dal compilatore.
  runApp(const Quiz());
}
