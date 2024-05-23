import 'dart:math';

class AIPlayer {
  int getNextMove(List<int> board) {
    List<int> availableMoves = [];
    for (int i = 0; i < 9; i++) {
      if (board[i] == 0) {
        availableMoves.add(i);
      }
    }

    if (availableMoves.isNotEmpty) {
      return availableMoves[Random().nextInt(availableMoves.length)];
    }

    // No available moves left, return a special value
    return -2; // or any other value that won't cause a RangeError
  }
}