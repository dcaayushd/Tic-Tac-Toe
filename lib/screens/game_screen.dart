import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../logic/game_logic.dart';
import '../widgets/timer_widget.dart';
import 'score_display.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameLogic _gameLogic = GameLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ScoreDisplay(
                oScore: _gameLogic.oScore,
                xScore: _gameLogic.xScore,
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _gameLogic.tapped(index);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 5,
                          color: MainColor.primaryColor,
                        ),
                        color: _gameLogic.matchedIndexes.contains(index)
                            ? MainColor.accentColor
                            : MainColor.secondaryColor,
                      ),
                      child: Center(
                        child: Text(
                          _gameLogic.displayXO[index],
                          style: GoogleFonts.coiny(
                            textStyle: TextStyle(
                              fontSize: 64,
                              color: _gameLogic.displayXO[index] == 'X'
                                  ? Colors.red // Color for 'X'
                                  : _gameLogic.displayXO[index] == 'O'
                                      ? Colors.green // Color for 'O'
                                      : MainColor.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _gameLogic.resultDeclaration,
                      style: GoogleFonts.coiny(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          letterSpacing: 3,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (_gameLogic.resultDeclaration.isNotEmpty)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _gameLogic.startTimer();
                            _gameLogic.clearBoard();
                          });
                        },
                        child: const Text(
                          'Play Again!',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      )
                    else
                      TimerWidget(
                        seconds: _gameLogic.seconds,
                        isRunning: _gameLogic.isTimerRunning,
                        startTimer: _gameLogic.startTimer,
                        clearBoard: _gameLogic.clearBoard,
                        attempts: _gameLogic.attempts,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
