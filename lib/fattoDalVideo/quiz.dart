// Import dei file locali e delle librerie necessarie.
// - questions.dart: contiene la lista di domande e risposte.
// - questions_screen.dart: widget che mostra le domande.
// - start_screen.dart: widget iniziale con il pulsante "Start Quiz".
// - results_screen.dart: widget finale che mostra i risultati.
// - flutter/material.dart: libreria base per costruire UI con Material Design.
import 'package:adv_basics/fattoDalVideo/data/questions.dart';
import 'package:adv_basics/fattoDalVideo/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/fattoDalVideo/start_screen.dart';
import 'package:adv_basics/fattoDalVideo/results_screen.dart';

/// Widget principale dell'app.
/// Estende StatefulWidget perché l'interfaccia deve cambiare dinamicamente
/// (da schermata iniziale → domande → risultati).
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

/// Classe di stato associata a Quiz.
/// Qui gestiamo quale schermata mostrare e le risposte selezionate.
class _QuizState extends State<Quiz> {
  /// Variabile che indica quale schermata è attiva.
  /// Possibili valori:
  /// - "start-screen"
  /// - "questions-screen"
  /// - "results-screen"
  var activeScreen = 'start-screen';

  /// Lista che contiene le risposte scelte dall'utente.
  /// È `final` perché la variabile non viene riassegnata,
  /// ma la lista può essere modificata con `.add()`.
  final List<String> selectedAnswers = [];

  /// Funzione che passa dalla schermata iniziale a quella delle domande.
  /// `setState()` ricostruisce la UI mostrando il nuovo widget.
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  /// Funzione chiamata ogni volta che l'utente seleziona una risposta.
  /// - Aggiunge la risposta alla lista `selectedAnswers`.
  /// - Se il numero di risposte date = numero di domande,
  ///   cambia schermata e mostra i risultati.
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    /// Variabile che contiene il widget da mostrare a schermo.
    /// Di default è StartScreen, a cui passiamo la funzione `switchScreen`
    /// come callback: quando l'utente preme "Start Quiz", viene chiamata.
    Widget screenWidget = StartScreen(switchScreen);

    // Se siamo nella fase delle domande, mostriamo QuestionsScreen.
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    // Se tutte le domande sono state risposte, mostriamo ResultsScreen.
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswer: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    /// MaterialApp: contenitore principale dell'app.
    /// Scaffold: struttura base (body, appBar, ecc.).
    /// Container: sfondo con gradiente e ombra rossa per lo stile.
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF000000), // nero
                Color(0xFF8B0000), // rosso scuro
                Color(0xFFFF0033), // rosso acceso
                Color(0xFF8B0000), // rosso scuro
                Color(0xFF000000), // nero
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFB00020), // ombra rossa
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          // Mostriamo la schermata attiva (Start, Questions o Results).
          child: screenWidget,
        ),
      ),
    );
  }
}
