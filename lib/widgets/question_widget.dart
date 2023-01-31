import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key? key,
      required this.question,
      required this.indexAction,
      required this.totalQuestion})
      : super(key: key);

  final String question;
  final int indexAction;
  final int totalQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'Question ${indexAction + 1}/$totalQuestion: $question',
        style: TextStyle(fontSize: 22, color: neutral),
      ),
    );
  }
}
