// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, unused_local_variable

class ShopLoginModel {
  bool? status;
  String? message;
  UserData? data;
  ShopLoginModel({this.status, this.message, this.data});
  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> infoData = new Map<String, dynamic>();
    infoData['status'] = status;
    infoData['message'] = message;
    if (this.data != null) {
      infoData['data'] = this.data!.toJson();
    }

    return infoData;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  double? credit;
  String? token;
  UserData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,
  });
  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['points'] = this.points;
    data['credit'] = this.credit;
    data['token'] = this.token;
    return data;
  }
}

/**{
    "status": true,
    "message": "تم تسجيل الدخول بنجاح",
    "data": {
        "id": 62831,
        "name": "Ali lotfy",
        "email": "alilotfy4321@gmail.com",
        "phone": "0155453420",
        "image": "https://student.valuxapps.com/storage/uploads/users/ifwGdeuAaT_1710510851.jpeg",
        "points": 0,
        "credit": 0,
        "token": "CPAf2nlwGOaWgX5PxAj86u7Fa3Bp5igR4zkCs32XKpEM9DwfWJAKfTG47cvYDqDgIDjoFG"
    }
} */