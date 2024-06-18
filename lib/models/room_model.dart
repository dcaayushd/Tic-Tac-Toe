
import 'package:tic_tac_toe/models/user_model.dart';

class RoomModel {
  String? id;
  String? entryFee;
  String? winningPrize;
  String? drawMatch;
  UserModel? player1;
  UserModel? player2;
 
  RoomModel({
    this.id,
    this.entryFee,
    this.winningPrize,
    this.drawMatch,
    this.player1,
    this.player2,
 
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
 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["entryFee"] = entryFee;
    _data["winningPrize"] = winningPrize;
    _data["drawMatch"] = drawMatch;
    if (player1 != null) {
      _data["player1"] = player1?.toJson();
    }
    if (player2 != null) {
      _data["player2"] = player2?.toJson();
    }
    
    return _data;
  }
}
