class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  //qui creiamo una nuova lista a partire da answers
  //List.of(answers) fa una copia della lista originale
  //cosi non modifica direttamente la lista originale
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    //shuffle() è un metodo di List in Dart
    //rimescola gli elementi della lista in ordine casuale
    //ogni volta che lo chiami, l'ordine cambia
    shuffledList.shuffle();

    //Restituiamo la lista rimescolata
    return shuffledList;
  }
}
