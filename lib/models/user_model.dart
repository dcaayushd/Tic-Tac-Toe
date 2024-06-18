class UserModel {
  String? id;
  String? name;
  String? email;
  String? image;
  String? totalWins;
  String? role;
 

  UserModel({
    this.role,
    this.id,
    this.name,
    this.email,
    this.image,
    this.totalWins,
  
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["totalWins"] is String) {
      totalWins = json["totalWins"];
    }
    if (json["role"] is String) {
      role = json["role"];
    }
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["image"] = image;
    _data["totalWins"] = totalWins;
    _data["role"] = role;
   
    return _data;
  }
}
