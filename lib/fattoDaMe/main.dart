import 'package:flutter/material.dart';
import 'gradient_container.dart';
import 'images_container.dart';
import 'style_text.dart';

void main() {
  runApp(
    const MaterialApp(
      //Scaffold è una struttura base per una schermata dell'app
      //qui possiamo definire appBar, body, drawer, bottomNavigationBar, colori di sfondo, tema, testo ecc.
      //di solito si usano tutti i widget personalizzati all'interno del body del Scaffold, cosi da scegliere dove
      //posizionare ogni widget
      home: Scaffold(
        body: GradientContainer(
          Colors.deepPurple,
          Colors.deepOrangeAccent,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImagesContainer(), // logo
                SizedBox(height: 20), // spaziatura
                StyleText('Benvenuto nel Quiz!'), // testo stilizzato
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
