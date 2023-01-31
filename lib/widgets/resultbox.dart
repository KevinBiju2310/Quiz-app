import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {super.key, required this.result, required this.questionLength, required this.onPressed});
  final int result;
  final int questionLength;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(70),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Result',
              style: TextStyle(color: neutral, fontSize: 22.0),
            ),
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
                radius: 60,
                backgroundColor: result == questionLength / 2
                    ? Colors.yellow
                    : result < questionLength / 2
                        ? incorrect
                        : correct,
                child: Text(
                  '$result/$questionLength',
                  style: const TextStyle(fontSize: 24),
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              result == questionLength / 2
                  ? 'Almost There'
                  : result < questionLength / 2
                      ? 'Try Again'
                      : 'Great!',
              style: TextStyle(color: neutral, fontSize: 15),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: onPressed,
              child: const Text(
                'Start Over',
                style: TextStyle(
                    color: Colors.blue, fontSize: 20, letterSpacing: 2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
