import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';

class Options extends StatelessWidget {
  const Options({
    super.key,
    required this.option,
    required this.color,
  });
  final String option;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          option,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22,
              color: color.red != color.green ? neutral : Colors.black  ),
        ),
      ),
    );
  }
}
