// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:equipos_lab_qr_scan/infraestructure/models/equipos/equipos_resp_model.dart';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  final Mantenimiento? data;

  Welcome({
    this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data:
            json["data"] == null ? null : Mantenimiento.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Mantenimiento {
  final int? id;
  final int? idEquipo;
  final String? tecnicoId;
  final dynamic descripcion;
  final dynamic caracteristicas;
  final dynamic recomendacionesFabricante;
  final DateTime? fechaInicio;
  final dynamic fechaFin;
  final int? estadoId;
  final DateTime? createdAt;
  final Tecnico? tecnico;

  Mantenimiento({
    this.id,
    this.idEquipo,
    this.tecnicoId,
    this.descripcion,
    this.caracteristicas,
    this.recomendacionesFabricante,
    this.fechaInicio,
    this.fechaFin,
    this.estadoId,
    this.createdAt,
    this.tecnico,
  });

  factory Mantenimiento.fromJson(Map<String, dynamic> json) => Mantenimiento(
        id: json["id"],
        idEquipo: json["idEquipo"],
        tecnicoId: json["tecnicoId"],
        descripcion: json["descripcion"],
        caracteristicas: json["caracteristicas"],
        recomendacionesFabricante: json["recomendacionesFabricante"],
        fechaInicio: json["fechaInicio"] == null
            ? null
            : DateTime.parse(json["fechaInicio"]),
        fechaFin: json["fechaFin"],
        estadoId: json["estadoId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        tecnico:
            json["tecnico"] == null ? null : Tecnico.fromJson(json["tecnico"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idEquipo": idEquipo,
        "tecnicoId": tecnicoId,
        "descripcion": descripcion,
        "caracteristicas": caracteristicas,
        "recomendacionesFabricante": recomendacionesFabricante,
        "fechaInicio":
            "${fechaInicio!.year.toString().padLeft(4, '0')}-${fechaInicio!.month.toString().padLeft(2, '0')}-${fechaInicio!.day.toString().padLeft(2, '0')}",
        "fechaFin": fechaFin,
        "estadoId": estadoId,
        "createdAt": createdAt?.toIso8601String(),
        "tecnico": tecnico?.toJson(),
      };
}
