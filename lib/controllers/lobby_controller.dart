import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Configs/Messages.dart';
import '../models/room_model.dart';

class LobbyController extends GetxController {
  final db = FirebaseFirestore.instance;

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
}
