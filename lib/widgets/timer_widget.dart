import 'dart:async';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TimerWidget extends StatefulWidget {
  final Function startTimer;
  final Function clearBoard;
  final int attempts;

  const TimerWidget({
    required this.startTimer,
    required this.clearBoard,
    required this.attempts,
    super.key,
  });

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late int _seconds;
  // Timer? _timer = null;
  Timer? _timer;
  bool _isRunning = false;
  bool _shouldStartTimer = false;

  @override
  void initState() {
    super.initState();
    _seconds = 30;
  }

  void _startTimer() {
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        if (_seconds > 0) {
          setState(() {
            _seconds--;
          });
        } else {
          _timer?.cancel();
          _isRunning = false;
          _seconds = 30;
          _shouldStartTimer = false; // Reset the flag
          widget.clearBoard(); // Call clearBoard when timer ends
        }
      }
    });
    widget.startTimer(); // Call startTimer immediately
  }

  // void _clearBoard() {
  //   _isRunning = false;
  //   _timer?.cancel();
  //   _seconds = 30;
  //   widget.clearBoard();
  //   _shouldStartTimer =
  //       true; // Start the timer immediately after clearing the board
  // }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_shouldStartTimer) {
      _shouldStartTimer = false; // Reset the flag
      _startTimer(); // Start the timer
    }

    return _isRunning
        ? SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 1 - _seconds / 30,
                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 8,
                  backgroundColor: MainColor.accentColor,
                ),
                Center(
                  child: Text(
                    '$_seconds',
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
            // onPressed: _startTimer,
            onPressed: () {
              setState(() {
                _startTimer();

              });
            },

            child: const Text(
              'Start',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          );
  }
}
