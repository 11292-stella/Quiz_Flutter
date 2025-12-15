import 'package:flutter/material.dart';

//anche questo widget che mostrerà le domande del quiz è uno StatefulWidget,
//perchè in futuro dovrà aggiornarsi quando l'utente risponderà alle domande
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    return const Text('Questions Screen');
  }
}
