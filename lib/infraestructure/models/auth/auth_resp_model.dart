// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    final String? accessToken;
    final String? refreshToken;
    final String? userId;
    final User? user;

    Welcome({
        this.accessToken,
        this.refreshToken,
        this.userId,
        this.user,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        userId: json["userId"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "userId": userId,
        "user": user?.toJson(),
    };
}

class User {
    final String? id;
    final String? name;
    final String? email;
    final String? password;
    final String? picture;
    final int? v;

    User({
        this.id,
        this.name,
        this.email,
        this.password,
        this.picture,
        this.v,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        picture: json["picture"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "picture": picture,
        "__v": v,
    };
}
