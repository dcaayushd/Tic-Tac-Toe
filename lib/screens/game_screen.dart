import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/ai_player.dart';
import 'package:tic_tac_toe/utils/game_logic.dart';
import 'package:tic_tac_toe/widgets/board.dart';

class GameScreen extends StatefulWidget {
  final bool isMultiplayer;

  const GameScreen({super.key, required this.isMultiplayer});

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  GameLogic gameLogic = GameLogic();
  AIPlayer aiPlayer = AIPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Board(
          gameLogic: gameLogic,
          isMultiplayer: widget.isMultiplayer,
          onNextMove: () {
            if (!widget.isMultiplayer) {
              int move = aiPlayer.getNextMove(gameLogic.board);
              if (move != -2) {
                // Check for the special value
                gameLogic.makeMove(move);
                setState(() {});
              }
            }
          },
        ),
      ),
    );
  }
}
