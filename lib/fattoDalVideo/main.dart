import 'package:adv_basics/fattoDalVideo/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 74, 34, 143),
                Color.fromARGB(255, 12, 43, 220),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          //Il widget Center che abbiamo implementato nella clase StrartScreen
          //posiziona il testo al centro, e occupa tutto lo spazio disponibile
          child: const StartScreen(),
        ),
      ),
    ),
  );
}
