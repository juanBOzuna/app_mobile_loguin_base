// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    final String? token;
    final User? user;

    Welcome({
        this.token,
        this.user,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
    };
}

class User {
    final String? id;
    final String? nombres;
    final String? apellidos;
    final String? fullname;
    final String? userName;
    final int? rolId;
    final String? rol;

    User({
        this.id,
        this.nombres,
        this.apellidos,
        this.fullname,
        this.userName,
        this.rolId,
        this.rol,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        fullname: json["fullname"],
        userName: json["userName"],
        rolId: json["rolId"],
        rol: json["rol"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombres": nombres,
        "apellidos": apellidos,
        "fullname": fullname,
        "userName": userName,
        "rolId": rolId,
        "rol": rol,
    };
}
