
import 'package:tic_tac_toe/models/user_model.dart';

class RoomModel {
  String? id;
  String? entryFee;
  String? winningPrize;
  String? drawMatch;
  UserModel? player1;
  UserModel? player2;
  String? gameStatus;
  String? player1Status;
  String? player2Status;
  List<String>? gameValue;
  bool? isXturn;
  RoomModel({
    this.id,
    this.entryFee,
    this.winningPrize,
    this.drawMatch,
    this.player1,
    this.player2,
    this.gameStatus,
    this.player1Status,
    this.player2Status,
    this.gameValue,
    this.isXturn,
  });

  RoomModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["entryFee"] is String) {
      entryFee = json["entryFee"];
    }
    if (json["winningPrize"] is String) {
      winningPrize = json["winningPrize"];
    }
    if (json["drawMatch"] is String) {
      drawMatch = json["drawMatch"];
    }
    if (json["player1"] is Map) {
      player1 =
          json["player1"] == null ? null : UserModel.fromJson(json["player1"]);
    }
    if (json["player2"] is Map) {
      player2 =
          json["player2"] == null ? null : UserModel.fromJson(json["player2"]);
    }
    if (json["gameStatus"] is String) {
      gameStatus = json["gameStatus"];
    }
    if (json["player1Status"] is String) {
      player1Status = json["player1Status"];
    }
    if (json["player2Status"] is String) {
      player2Status = json["player2Status"];
    }
    if (json["gameValue"] is List) {
      gameValue = json["gameValue"] == null
          ? null
          : List<String>.from(json["gameValue"]);
    }
    if (json["isXturn"] is bool) {
      isXturn = json["isXturn"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["entryFee"] = entryFee;
    data["winningPrize"] = winningPrize;
    data["drawMatch"] = drawMatch;
    if (player1 != null) {
      data["player1"] = player1?.toJson();
    }
    if (player2 != null) {
      data["player2"] = player2?.toJson();
    }
    data["gameStatus"] = gameStatus;
    data["player1Status"] = player1Status;
    data["player2Status"] = player2Status;
    if (gameValue != null) {
      data["gameValue"] = gameValue;
    }
    data["isXturn"] = isXturn;
    return data;
  }
}
