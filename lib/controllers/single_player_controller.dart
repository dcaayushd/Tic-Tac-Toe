import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../configs/assets_path.dart';

class SinglePlayerController extends GetxController {
  RxList playValue = ["", "", "", "", "", "", "", "", ""].obs;
  RxBool isXtime = true.obs;
  RxInt xScore = 0.obs;
  RxInt oScore = 0.obs;

  void onClick(int index) {
    if (playValue[index] == "") {
      if (isXtime.value) {
        playValue[index] = "X";
        isXtime.value = !isXtime.value;
      } else {
        playValue[index] = "O";
        isXtime.value = !isXtime.value;
      }
    }
    checkWinner();
  }

  void checkWinner() {
    // Vertical
    if (playValue[0] == playValue[1] &&
        playValue[0] == playValue[2] &&
        playValue[0] != "") {
      print("winner is ${playValue[0]}");
      winnerDialog(playValue[0]);
    } else if (playValue[3] == playValue[4] &&
        playValue[3] == playValue[5] &&
        playValue[3] != "") {
      winnerDialog(playValue[3]);
      print("winner is ${playValue[3]}");
    } else if (playValue[6] == playValue[7] &&
        playValue[6] == playValue[8] &&
        playValue[6] != "") {
      print("winner is ${playValue[6]}");
      winnerDialog(playValue[6]);
    }
    // Horizontal
    else if (playValue[0] == playValue[3] &&
        playValue[0] == playValue[6] &&
        playValue[0] != "") {
      winnerDialog(playValue[0]);
      print("winner is ${playValue[0]}");
    } else if (playValue[1] == playValue[4] &&
        playValue[1] == playValue[7] &&
        playValue[1] != "") {
      winnerDialog(playValue[1]);
      print("winner is ${playValue[1]}");
    } else if (playValue[2] == playValue[5] &&
        playValue[2] == playValue[8] &&
        playValue[2] != "") {
      winnerDialog(playValue[2]);
      print("winner is ${playValue[2]}");

      // diagonal
    } else if (playValue[0] == playValue[4] &&
        playValue[0] == playValue[8] &&
        playValue[0] != "") {
      winnerDialog(playValue[0]);
      print("winner is ${playValue[0]}");
    } else if (playValue[2] == playValue[4] &&
        playValue[2] == playValue[6] &&
        playValue[2] != "") {
      print("winner is ${playValue[2]}");
      winnerDialog(playValue[2]);
    } else {
      if (!playValue.contains("")) {
        winnerDialog("no-one");
      }
    }
  }

  Future<dynamic> winnerDialog(String winner) {
    scoreCalculate(winner);
    return Get.defaultDialog(
        barrierDismissible: false,
        title: winner == "no-one" ? "Match Draw" : "Congratulations",
        backgroundColor: Colors.white,
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: winner == "no-one"
              ? Column(
                  children: [
                    const Text(
                      "Match Draw",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      "You both played well",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            resetGame();
                          },
                          child: Text("Play Again"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.offAllNamed("/home");
                          },
                          child: Text("Exit"),
                        )
                      ],
                    )
                  ],
                )
              : Column(
                  children: [
                    SvgPicture.asset(
                      IconsPath.wonIcon,
                      width: 100,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Congratulations",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "$winner won the match",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            resetGame();
                          },
                          child: Text("Play Again"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.offAllNamed("/home");
                          },
                          child: Text("Exit"),
                        )
                      ],
                    )
                  ],
                ),
        ));
  }

  void resetGame() {
    playValue.value = ["", "", "", "", "", "", "", "", ""].obs;
    isXtime.value = !isXtime.value;
    Get.back();
  }

  void scoreCalculate(String winner) {
    if (winner == "X") {
      xScore.value = xScore.value + 1;
    } else if (winner == "O") {
      oScore.value = oScore.value + 1;
    } else {
      xScore.value = xScore.value;
      oScore.value = oScore.value;
    }
  }
}
