class ShopLoginModel {
  bool? status;
  String? message;
  UserData? data;

  // named constractor
  ShopLoginModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // to check if data not equall null store data in the map inside variable data (make parse if it not null)
    data = json['data'] != null ? UserData.fromjson(json['data']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? point;
  int? credit;
  String? token;

  UserData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    point = json['point'];
    credit = json['credit'];
    token = json['token'];
  }
}
