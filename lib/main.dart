import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4_flashcard/flashcard.dart';
import 'package:flutter_d4_flashcard/flashcard_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Flashcard> _flashcards = [
    Flashcard(
      question: "question 1",
      answer: "answer 1",
    ),
    Flashcard(
      question: "question 2",
      answer: "answer 2",
    ),
    Flashcard(
      question: "question 3",
      answer: "answer 3",
    ),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                  fill: Fill.fillBack,
                  direction: FlipDirection.HORIZONTAL,
                  front:
                      FlashcardView(text: _flashcards[_currentIndex].question),
                  back: FlashcardView(text: _flashcards[_currentIndex].answer),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                    onPressed: showPrevCard,
                    icon: const Icon(Icons.chevron_left),
                    label: const Text('Prev'),
                  ),
                  OutlinedButton.icon(
                    onPressed: showNextCard,
                    icon: const Icon(Icons.chevron_right),
                    label: const Text('Next'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPrevCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length-1;
    });
  }
}
