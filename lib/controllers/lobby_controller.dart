import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Configs/Messages.dart';
import '../models/room_model.dart';

class LobbyController extends GetxController {
  final db = FirebaseFirestore.instance;
  RxInt waitingTime = 5.obs;
  void copyRoomCode(String roomCode) {
    FlutterClipboard.copy(roomCode).then(
      (value) => successMessage("Copied"),
    );
  }

  Stream<RoomModel> getRoomDetails(String roomId) {
    return db.collection("rooms").doc(roomId).snapshots().map(
          (event) => RoomModel.fromJson(
            event.data()!,
          ),
        );
  }

  Future<void> startGame() async {
    waitingTime.value = 5;
    while (waitingTime.value > 0) {
      await Future.delayed(Duration(seconds: 1));
      waitingTime.value--;
      print(waitingTime.value);
    }
  }

  Future<void> updatePlayer1Status(String roomId, String status) async {
    await db.collection("rooms").doc(roomId).update(
      {
        "player1Status": status,
      },
    );
  }

  Future<void> updatePlayer2Status(String roomId, String status) async {
    await db.collection("rooms").doc(roomId).update(
      {
        "player2Status": status,
      },
    );
  }
}
