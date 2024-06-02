// import 'dart:async';
// import 'package:flutter/material.dart';
// import '../constants/colors.dart';

// class TimerWidget extends StatelessWidget {
//   final int seconds;
//   final bool isRunning;
//   final Function startTimer;
//   final Function clearBoard;
//   final int attempts;

//   const TimerWidget({
//     required this.seconds,
//     required this.isRunning,
//     required this.startTimer,
//     required this.clearBoard,
//     required this.attempts,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return isRunning
//         ? SizedBox(
//             width: 100,
//             height: 100,
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 CircularProgressIndicator(
//                   value: 1 - seconds / 30,
//                   valueColor: const AlwaysStoppedAnimation(Colors.white),
//                   strokeWidth: 8,
//                   backgroundColor: MainColor.accentColor,
//                 ),
//                 Center(
//                   child: Text(
//                     '$seconds',
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       fontSize: 50,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         : ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.white,
//               padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//             ),
//             onPressed: () {
//               startTimer();
//               clearBoard();
//             },
//             child: Text(
//               attempts == 0 ? 'Start' : 'Play Again!',
//               style: const TextStyle(fontSize: 20, color: Colors.black),
//             ),
//           );
//   }
// }


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
  Timer? _timer = null;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _seconds = 30;
  }

  void _startTimer() {
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer?.cancel();
        _isRunning = false;
        _seconds = 30;
      }
    });
    widget.startTimer();
  }

  void _clearBoard() {
    _isRunning = false;
    _timer?.cancel();
    _seconds = 30;
    widget.clearBoard();
  }

    @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
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
            onPressed: _startTimer,
            child: Text(
              widget.attempts == 0 ? 'Start' : 'Play Again!',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          );
  }
}