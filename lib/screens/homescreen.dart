import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/models/question.dart';
import 'package:quizapp/widgets/options.dart';
import 'package:quizapp/widgets/resultbox.dart';

import '../widgets/next_button.dart';
import '../widgets/question_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Question> _question = [
    Question(
        id: '10',
        title: 'When was flutter invented?',
        options: {'2015': false, '2018': true, '2020': false, '2021': false}),
    Question(id: '10', title: 'Flutter framework was created by', options: {
      'Microsoft': false,
      'Google': true,
      'Apple': false,
      'Amazon': false
    }),
  ];
  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;
  void nextQuestion() {
    if (index == _question.length - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: ((context) => ResultBox(
                result: score,
                questionLength: _question.length,
                onPressed: startover,
              )));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: incorrect,
          content: const Text('Select any option'),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  void checkAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  void startover() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: const Text('Quiz App'),
        shadowColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text('Score: $score'),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            QuestionWidget(
                question: _question[index].title,
                indexAction: index,
                totalQuestion: _question.length),
            Divider(
              color: neutral,
            ),
            const SizedBox(
              height: 20,
            ),
            for (int i = 0; i < _question[index].options.length; i++)
              GestureDetector(
                onTap: () {
                  checkAndUpdate(_question[index].options.values.toList()[i]);
                },
                child: Options(
                  option: _question[index].options.keys.toList()[i],
                  color: isPressed
                      ? _question[index].options.values.toList()[i] == true
                          ? correct
                          : incorrect
                      : neutral,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
