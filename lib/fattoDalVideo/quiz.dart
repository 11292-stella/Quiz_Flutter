import 'package:adv_basics/fattoDalVideo/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/fattoDalVideo/start_screen.dart';

//la classe Quiz esende StatefulWidget perchè abbiamo bisogno di cambiare lo schermo attivo
//quando l'utente preme il bottone Start Quiz
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //dato che abbiamo bisogno di cambiare lo schermo attivo, per far partire il widget Quiz,
  //dobbiamoo definire una variabile di stato.
  //inizialmente lo schermo attivo darà lo StartScren (che contiene MaterialApp e Scaffold e quindi da dove parte l'App)
  //poi, quando l'utente preme il bottone Start Quiz che si trova nello StartScreen, cambieremo questa variabile
  //per far partire il QuestionsScreeen.
  //in questo caso dato che StartScreen è un widget, non possiamo definire la viariabile con var perchè var darebbe il tipo
  //Startscreen anche a QuestionsScreen, quindi dobbiamo usare il tipo Widget come variabile generica per tutti i widget
  //Qui stiamo applicando il concetto di "state lifting":
  //invece di lasciare che ogni widget gestisca da solo il proprio stato,
  //centralizziamo la variabile activeScreen nella classe principale.
  //In questo modo, widget che non sono direttamente collegati tra loro
  //(StartScreen e QuestionsScreen) possono comunque comunicare,
  //perché la logica di quale schermata mostrare è gestita a un livello superiore.
  //Questo è utile per coordinare più widget e mantenere la UI sincronizzata.
  //qui stiamo passando una funzione come parametro a un widget(StartScreen)
  //in pratica, switchScreen che contiene (lo state) viene definitia nella classe principale, cosi quando
  //l'utente preme il bottone dentro StartScreen, StartScreen stesso invoca switchScreen() e comunica con il genitore
  //questo è un esempio di callback: il figlio non gestisce direttamente il cambio di schermata, ma chiama la funzione
  //che il genitore gli ha dato.
  //Il ? indica che può essere null (cioè inizialmente vuota)
  Widget? activeScreen;

  @override
  void initState() {
    //questo metodo viene chiamato una sola volta, appena il widget viene creato.
    //serve per inizializzare lo stato prima che venga custruita la UI
    //lo usiamo per evitare che la logica del quiz parta troppo presto,
    //e per assicurarci che tutto sia pronto prima di mostrare la schermata iniziale
    //è il posto giusto per preparare variabili, listener, o chiamate iniziali.
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  //qui definiamo una funzione che cambierà lo schermo attivo iniziale ( Widget activeScreen = const StartScreen();)
  //con il QuestionScreen widget quando l'utente preme il bottone Start Quiz
  //Grazie a setState Flutter ricostruisce la classe (ribuild) ogni volta che cambia lo stato.
  //In questo caso, al click del bottone "Start Quiz", aggiorniamo la variabile activeScreen.
  //Il rebuild fa sì che lo schermo iniziale (StartScreen) venga sostituito con QuestionsScreen.
  //Questo è il meccanismo fondamentale per gestire interazioni e transizioni tra schermate.
  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(context) {
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
          //Il widget Center che abbiamo implementato nella clase StrartScreen
          //posiziona il testo al centro, e occupa tutto lo spazio disponibile
          //ora in child possiamo sostituire StartScreen con la variabile creata di tipo widget
          child: activeScreen,
        ),
      ),
    );
  }
}
