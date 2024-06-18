import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../configs/assets_path.dart';
import '../models/room_model.dart';
import '../models/user_model.dart';

class MultiPlayerController extends GetxController {
  final db = FirebaseFirestore.instance;
  Stream<RoomModel> getRoomDetails(String roomId) {
    return db.collection("rooms").doc(roomId).snapshots().map(
          (event) => RoomModel.fromJson(
            event.data()!,
          ),
        );
  }

  Future<void> updateData(String roomId, List<String> gameValue, int index,  bool isXTurn, RoomModel roomData
      ) async {
    List<String> oldValue = gameValue;
    if (isXTurn) {
      if (oldValue[index] == '') {
        oldValue[index] = "X";
        print(oldValue);
        await db.collection("rooms").doc(roomId).update({
          "gameValue": oldValue,
          "isXturn": false,
        });
      }
    } else if (!isXTurn) {
      if (oldValue[index] == '') {
        oldValue[index] = "O ";
        print(oldValue);
        await db.collection("rooms").doc(roomId).update({
          "gameValue": oldValue,
          "isXturn": true,
        });
      }
    }


  }

}
