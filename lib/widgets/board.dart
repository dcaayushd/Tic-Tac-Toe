import 'package:flutter/material.dart';
// import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/utils/game_logic.dart';
import 'package:tic_tac_toe/widgets/tile.dart';

class Board extends StatefulWidget {
  final GameLogic gameLogic;
  final bool isMultiplayer;
  final Function onNextMove;

  const Board({super.key, 
    required this.gameLogic,
    required this.isMultiplayer,
    required this.onNextMove,
  });

  @override
  BoardState createState() => BoardState();
}

class BoardState extends State<Board> {
  late List<int> board;
  late List<int> winningLine;

  @override
  void initState() {
    super.initState();
    board = widget.gameLogic.board;
    winningLine = [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return Tile(
              onTap: () {
                if (board[index] == 0 && widget.gameLogic.getWinner() == 0) {
                  setState(() {
                    widget.gameLogic.makeMove(index);
                    winningLine = getWinningLine(widget.gameLogic.getWinner());
                    widget.onNextMove();
                  });
                }
              },
              value: board[index],
              isWinningTile: winningLine.contains(index),
            );
          },
        ),
        const SizedBox(height: 16.0),
        Text(
          getWinnerMessage(widget.gameLogic.getWinner()),
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  List<int> getWinningLine(int winner) {
    if (winner == 0) {
      return [];
    } else if (winner == 1 || winner == 2) {
      // Check rows
      for (int i = 0; i < 9; i += 3) {
        if (board[i] == winner &&
            board[i + 1] == winner &&
            board[i + 2] == winner) {
          return [i, i + 1, i + 2];
        }
      }

      // Check columns
      for (int i = 0; i < 3; i++) {
        if (board[i] == winner &&
            board[i + 3] == winner &&
            board[i + 6] == winner) {
          return [i, i + 3, i + 6];
        }
      }

      // Check diagonals
      if (board[0] == winner && board[4] == winner && board[8] == winner) {
        return [0, 4, 8];
      }
      if (board[2] == winner && board[4] == winner && board[6] == winner) {
        return [2, 4, 6];
      }
    }

    return [];
  }

  String getWinnerMessage(int winner) {
    if (winner == 0) {
      return 'In progress';
    } else if (winner == 1) {
      return 'Player 1 wins!';
    } else if (winner == 2) {
      return 'Player 2 wins!';
    } else {
      return 'Draw';
    }
  }
}
