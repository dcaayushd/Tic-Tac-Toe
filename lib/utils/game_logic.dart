class GameLogic {
  List<int> board = List.filled(9, 0);
  int player = 1;

  bool makeMove(int index) {
    if (board[index] == 0) {
      board[index] = player;
      player = player == 1 ? 2 : 1;
      return true;
    }
    return false;
  }

  int getWinner() {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (board[i] != 0 &&
          board[i] == board[i + 1] &&
          board[i] == board[i + 2]) {
        return board[i];
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[i] != 0 &&
          board[i] == board[i + 3] &&
          board[i] == board[i + 6]) {
        return board[i];
      }
    }

    // Check diagonals
    if (board[0] != 0 && board[0] == board[4] && board[0] == board[8]) {
      return board[0];
    }
    if (board[2] != 0 && board[2] == board[4] && board[2] == board[6]) {
      return board[2];
    }

    // Check for draw
    if (!board.contains(0)) {
      return 3;
    }

    // Game is not over yet
    return 0;
  }
}