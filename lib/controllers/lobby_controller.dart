import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/room_model.dart';

class LobbyController extends GetxController {
  final db = FirebaseFirestore.instance;

  Stream<RoomModel> getRoomDetails(String roomId) {
    return db.collection("rooms").doc(roomId).snapshots().map(
          (event) => RoomModel.fromJson(
            event.data()!,
          ),
        );
  }
}
