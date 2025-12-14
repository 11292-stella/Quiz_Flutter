import 'package:flutter/material.dart';

class ImagesContainer extends StatelessWidget {
  const ImagesContainer({super.key});

  @override
  Widget build(contex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [Image.asset('assets/images/quiz-logo.png', width: 300)],
    );
  }
}
