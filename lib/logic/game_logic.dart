import 'dart:async';

class GameLogic {
  bool oTurn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  List<int> matchedIndexes = [];
  int attempts = 0;

  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  String resultDeclaration = '';
  bool winnerFound = false;

  static const maxSeconds = 30;
  int seconds = maxSeconds;
  Timer? timer;

  bool get isTimerRunning => timer != null && timer!.isActive;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        seconds--;
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    resetTimer();
    timer?.cancel();
  }

  void resetTimer() => seconds = maxSeconds;

  void tapped(int index) {
    if (isTimerRunning) {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        filledBoxes++;
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        filledBoxes++;
      }

      oTurn = !oTurn;
      checkWinner();
    }
  }

  void checkWinner() {
    // check 1st row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      resultDeclaration = 'Player ${displayXO[0]} Wins!';
      matchedIndexes.addAll([0, 1, 2]);
      stopTimer();
      updateScore(displayXO[0]);
    }

    // check 2nd row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      resultDeclaration = 'Player ${displayXO[3]} Wins!';
      matchedIndexes.addAll([3, 4, 5]);
      stopTimer();
      updateScore(displayXO[3]);
    }

    // check 3rd row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      resultDeclaration = 'Player ${displayXO[6]} Wins!';
      matchedIndexes.addAll([6, 7, 8]);
      stopTimer();
      updateScore(displayXO[6]);
    }

    // check 1st column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      resultDeclaration = 'Player ${displayXO[0]} Wins!';
      matchedIndexes.addAll([0, 3, 6]);
      stopTimer();
      updateScore(displayXO[0]);
    }

    // check 2nd column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      resultDeclaration = 'Player ${displayXO[1]} Wins!';
      matchedIndexes.addAll([1, 4, 7]);
      stopTimer();
      updateScore(displayXO[1]);
    }

    // check 3rd column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      resultDeclaration = 'Player ${displayXO[2]} Wins!';
      matchedIndexes.addAll([2, 5, 8]);
      stopTimer();
      updateScore(displayXO[2]);
    }

    // check diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      resultDeclaration = 'Player ${displayXO[0]} Wins!';
      matchedIndexes.addAll([0, 4, 8]);
      stopTimer();
      updateScore(displayXO[0]);
    }

    // check diagonal
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != '') {
      resultDeclaration = 'Player ${displayXO[6]} Wins!';
      matchedIndexes.addAll([6, 4, 2]);
      stopTimer();
      updateScore(displayXO[6]);
    }
    if (!winnerFound && filledBoxes == 9) {
      resultDeclaration = 'Nobody Wins!';
      stopTimer();
    }
  }

  void updateScore(String winner) {
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
    winnerFound = true;
  }

  void clearBoard() {
    for (int i = 0; i < 9; i++) {
      displayXO[i] = '';
    }
    resultDeclaration = '';
    matchedIndexes = [];
    filledBoxes = 0;
    winnerFound = false;
  }

  // void resetGame() {
  //   // Reset game state variables
  //   oTurn = true;
  //   displayXO = ['', '', '', '', '', '', '', '', ''];
  //   matchedIndexes = [];
  //   resultDeclaration = '';
  //   winnerFound = false;
  //   filledBoxes = 0;
  //   resetTimer();
  // }
}
