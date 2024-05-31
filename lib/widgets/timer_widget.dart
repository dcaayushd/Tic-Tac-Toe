import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TimerWidget extends StatelessWidget {
  final int seconds;
  final bool isRunning;
  final Function startTimer;
  final Function clearBoard;
  final int attempts;

  const TimerWidget({
    required this.seconds,
    required this.isRunning,
    required this.startTimer,
    required this.clearBoard,
    required this.attempts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isRunning
        ? SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 1 - seconds / 30,
                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 8,
                  backgroundColor: MainColor.accentColor,
                ),
                Center(
                  child: Text(
                    '$seconds',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ],
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            onPressed: () {
              startTimer();
              clearBoard();
            },
            child: Text(
              attempts == 0 ? 'Start' : 'Play Again!',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          );
  }
}

