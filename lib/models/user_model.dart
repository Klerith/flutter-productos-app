// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

class User {
  User({
    required this.name,
    required this.email,
    required this.numero,
    required this.online,
    required this.uid,
  });

  final String name;
  final String email;
  final String numero;
  final bool online;
  final String uid;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["nombre"],
        email: json["email"],
        numero: json["numero"],
        online: json["online"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": name,
        "email": email,
        "numero": numero,
        "online": online,
        "uid": uid,
      };
}
