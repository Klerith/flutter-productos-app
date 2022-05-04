// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromMap(jsonString);

import 'dart:convert';

import 'package:productos_app/models/user_model.dart';


// LoginResponseModel loginResponseFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

// String loginResponseToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.ok = false,
    required this.user,
    required this.token,
  });

  bool ok;
  User user;
  String token;

  factory LoginResponseModel.fromJson(String str) =>
      LoginResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromMap(Map<String, dynamic> json) =>
      LoginResponseModel(
        ok: json["ok"],
        user: User.fromMap(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "ok": ok,
        "user": user.toMap(),
        "token": token,
      };
}
