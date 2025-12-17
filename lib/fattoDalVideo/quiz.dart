import 'package:adv_basics/fattoDalVideo/data/questions.dart';
import 'package:adv_basics/fattoDalVideo/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/fattoDalVideo/start_screen.dart';

// La classe Quiz estende StatefulWidget perché dobbiamo cambiare schermata
// quando l'utente preme il bottone "Start Quiz".
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Variabile di stato che indica quale schermata mostrare.
  // Inizialmente è "start-screen", poi diventa "questions-screen"
  // quando l'utente avvia il quiz.
  var activeScreen = 'start-screen';

  //creiamo la variabile List che conterrà le risposte selezionate da un utente
  //la definiamo final perchè non verrà riassegnata la variabile
  //ma verrà generata una nuova lista con .add
  final List<String> selectedAnswers = [];

  // Funzione che cambia lo stato da "start-screen" a "questions-screen".
  // setState ricostruisce la UI mostrando la nuova schermata.
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  //andiamo a creare il metodo che con .add anserirà le risposte nella
  //variabile lista creata "selectedAnswers"
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'start-screen';
      });
    }
  }

  @override
  Widget build(context) {
    // screenWidget è il widget che verrà mostrato a schermo.
    // Di default è StartScreen, a cui passiamo la funzione switchScreen
    // come callback: quando l'utente preme il bottone, StartScreen
    // invoca switchScreen() e comunica con il genitore.
    Widget screenWidget = StartScreen(switchScreen);

    // Se la variabile di stato è "questions-screen",
    // allora sostituiamo StartScreen con QuestionsScreen.
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    // MaterialApp è il contenitore principale dell'app.
    // Scaffold fornisce la struttura base (body, appBar, ecc.).
    // Dentro body usiamo un Container con sfondo a gradiente
    // e un'ombra rossa per dare stile.
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF000000),
                Color(0xFF8B0000),
                Color(0xFFFF0033),
                Color(0xFF8B0000),
                Color(0xFF000000),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFB00020),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          // Qui mostriamo lo schermo attivo (StartScreen o QuestionsScreen).
          child: screenWidget,
        ),
      ),
    );
  }
}
