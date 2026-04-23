class AuthResponse {
  String? accessToken;
  String? refreshToken;
  bool? status;
  UserModel? user;

  AuthResponse({this.accessToken, this.refreshToken, this.status, this.user});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    status = json['status'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class UserModel {
  String? email;
  int? id;
  String? imagePath;
  String? name;
  String? phone;
  String? password;

  UserModel({this.email, this.id, this.imagePath, this.name, this.phone, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];

    id = json['id'];
    imagePath = json['image_path'];
    name = json['name'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;

    data['id'] = id;
    data['image_path'] = imagePath;
    data['name'] = name;
    data['phone'] = phone;
    data['password'] = password;
    return data;
  }
}
