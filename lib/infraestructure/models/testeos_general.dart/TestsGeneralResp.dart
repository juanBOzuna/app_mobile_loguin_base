// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    final List<TestGeneral>? testGeneral;

    Welcome({
        this.testGeneral,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        testGeneral: json["TestGeneral"] == null ? [] : List<TestGeneral>.from(json["TestGeneral"]!.map((x) => TestGeneral.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "TestGeneral": testGeneral == null ? [] : List<dynamic>.from(testGeneral!.map((x) => x.toJson())),
    };
}

class TestGeneral {
    final int? id;
    final String? numeroCertificado;
    final int? idEquipo;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    TestGeneral({
        this.id,
        this.numeroCertificado,
        this.idEquipo,
        this.createdAt,
        this.updatedAt,
    });

    factory TestGeneral.fromJson(Map<String, dynamic> json) => TestGeneral(
        id: json["id"],
        numeroCertificado: json["numeroCertificado"],
        idEquipo: json["idEquipo"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "numeroCertificado": numeroCertificado,
        "idEquipo": idEquipo,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
