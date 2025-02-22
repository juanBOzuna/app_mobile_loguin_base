// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    final Data? data;

    Welcome({
        this.data,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    final Mantenimientos? mantenimientos;
    final Especificaciones? especificaciones;
    final Adquisicion? adquisicion;
    final LastAcion? lastCalibracion;
    final LastAcion? lastCalificacion;
    final LastAcion? lastVerificacion;
    final Equipo? equipo;

    Data({
        this.mantenimientos,
        this.especificaciones,
        this.adquisicion,
        this.lastCalibracion,
        this.lastCalificacion,
        this.lastVerificacion,
        this.equipo,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        mantenimientos: json["mantenimientos"] == null ? null : Mantenimientos.fromJson(json["mantenimientos"]),
        especificaciones: json["especificaciones"] == null ? null : Especificaciones.fromJson(json["especificaciones"]),
        adquisicion: json["adquisicion"] == null ? null : Adquisicion.fromJson(json["adquisicion"]),
        lastCalibracion: json["lastCalibracion"] == null ? null : LastAcion.fromJson(json["lastCalibracion"]),
        lastCalificacion: json["lastCalificacion"] == null ? null : LastAcion.fromJson(json["lastCalificacion"]),
        lastVerificacion: json["lastVerificacion"] == null ? null : LastAcion.fromJson(json["lastVerificacion"]),
        equipo: json["equipo"] == null ? null : Equipo.fromJson(json["equipo"]),
    );

    Map<String, dynamic> toJson() => {
        "mantenimientos": mantenimientos?.toJson(),
        "especificaciones": especificaciones?.toJson(),
        "adquisicion": adquisicion?.toJson(),
        "lastCalibracion": lastCalibracion?.toJson(),
        "lastCalificacion": lastCalificacion?.toJson(),
        "lastVerificacion": lastVerificacion?.toJson(),
        "equipo": equipo?.toJson(),
    };
}

class Adquisicion {
    final int? idAdquisicion;
    final int? idEquipo;
    final int? modoAdquisicionId;
    final int? proveedorId;
    final int? manualId;
    final DateTime? telefono;
    final DateTime? fechaCompra;
    final DateTime? fechaInstalacion;
    final DateTime? fechaVencimiento;
    final int? tiempoGarantiaMeses;
    final String? registroSanitario;
    final int? vidaUtilMeses;
    final int? periodicidadMantenimientoMeses;
    final int? calibracion;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Manual? modoAdquisicion;
    final Manual? manual;
    final Manual? proveedor;

    Adquisicion({
        this.idAdquisicion,
        this.idEquipo,
        this.modoAdquisicionId,
        this.proveedorId,
        this.manualId,
        this.telefono,
        this.fechaCompra,
        this.fechaInstalacion,
        this.fechaVencimiento,
        this.tiempoGarantiaMeses,
        this.registroSanitario,
        this.vidaUtilMeses,
        this.periodicidadMantenimientoMeses,
        this.calibracion,
        this.createdAt,
        this.updatedAt,
        this.modoAdquisicion,
        this.manual,
        this.proveedor,
    });

    factory Adquisicion.fromJson(Map<String, dynamic> json) => Adquisicion(
        idAdquisicion: json["idAdquisicion"],
        idEquipo: json["idEquipo"],
        modoAdquisicionId: json["modoAdquisicionId"],
        proveedorId: json["proveedorId"],
        manualId: json["manualId"],
        telefono: json["telefono"] == null ? null : DateTime.parse(json["telefono"]),
        fechaCompra: json["fechaCompra"] == null ? null : DateTime.parse(json["fechaCompra"]),
        fechaInstalacion: json["fechaInstalacion"] == null ? null : DateTime.parse(json["fechaInstalacion"]),
        fechaVencimiento: json["fechaVencimiento"] == null ? null : DateTime.parse(json["fechaVencimiento"]),
        tiempoGarantiaMeses: json["tiempoGarantiaMeses"],
        registroSanitario: json["registroSanitario"],
        vidaUtilMeses: json["vidaUtilMeses"],
        periodicidadMantenimientoMeses: json["periodicidadMantenimientoMeses"],
        calibracion: json["calibracion"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        modoAdquisicion: json["modoAdquisicion"] == null ? null : Manual.fromJson(json["modoAdquisicion"]),
        manual: json["manual"] == null ? null : Manual.fromJson(json["manual"]),
        proveedor: json["proveedor"] == null ? null : Manual.fromJson(json["proveedor"]),
    );

    Map<String, dynamic> toJson() => {
        "idAdquisicion": idAdquisicion,
        "idEquipo": idEquipo,
        "modoAdquisicionId": modoAdquisicionId,
        "proveedorId": proveedorId,
        "manualId": manualId,
        "telefono": "${telefono!.year.toString().padLeft(4, '0')}-${telefono!.month.toString().padLeft(2, '0')}-${telefono!.day.toString().padLeft(2, '0')}",
        "fechaCompra": "${fechaCompra!.year.toString().padLeft(4, '0')}-${fechaCompra!.month.toString().padLeft(2, '0')}-${fechaCompra!.day.toString().padLeft(2, '0')}",
        "fechaInstalacion": "${fechaInstalacion!.year.toString().padLeft(4, '0')}-${fechaInstalacion!.month.toString().padLeft(2, '0')}-${fechaInstalacion!.day.toString().padLeft(2, '0')}",
        "fechaVencimiento": "${fechaVencimiento!.year.toString().padLeft(4, '0')}-${fechaVencimiento!.month.toString().padLeft(2, '0')}-${fechaVencimiento!.day.toString().padLeft(2, '0')}",
        "tiempoGarantiaMeses": tiempoGarantiaMeses,
        "registroSanitario": registroSanitario,
        "vidaUtilMeses": vidaUtilMeses,
        "periodicidadMantenimientoMeses": periodicidadMantenimientoMeses,
        "calibracion": calibracion,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "modoAdquisicion": modoAdquisicion?.toJson(),
        "manual": manual?.toJson(),
        "proveedor": proveedor?.toJson(),
    };
}

class Manual {
    final int? id;
    final String? nombre;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? telefono;

    Manual({
        this.id,
        this.nombre,
        this.createdAt,
        this.updatedAt,
        this.telefono,
    });

    factory Manual.fromJson(Map<String, dynamic> json) => Manual(
        id: json["id"],
        nombre: json["nombre"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        telefono: json["telefono"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "telefono": telefono,
    };
}

class Equipo {
    final String? marca;
    final String? prioridad;
    final String? sede;
    final String? fabricante;
    final String? clasificacionRiesgo;
    final String? clasificacionBiometrica;
    final String? estadoColor;
    final String? estado;
    final String? tipoTecnologia;
    final int? estadoId;
    final int? idEquipo;
    final int? sistemaId;
    final String? sistema;
    final int? marcaId;
    final int? sedeId;
    final int? tipoTecnologiaId;
    final int? fabricanteId;
    final int? clasificacionBiomedicaId;
    final int? claseRiesgoId;
    final int? prioridadId;
    final String? ubicacion;
    final String? modelo;
    final String? serie;
    final String? codigoInternoInventario;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Equipo({
        this.marca,
        this.prioridad,
        this.sede,
        this.fabricante,
        this.clasificacionRiesgo,
        this.clasificacionBiometrica,
        this.estadoColor,
        this.estado,
        this.tipoTecnologia,
        this.estadoId,
        this.idEquipo,
        this.sistemaId,
        this.sistema,
        this.marcaId,
        this.sedeId,
        this.tipoTecnologiaId,
        this.fabricanteId,
        this.clasificacionBiomedicaId,
        this.claseRiesgoId,
        this.prioridadId,
        this.ubicacion,
        this.modelo,
        this.serie,
        this.codigoInternoInventario,
        this.createdAt,
        this.updatedAt,
    });

    factory Equipo.fromJson(Map<String, dynamic> json) => Equipo(
        marca: json["marca"],
        prioridad: json["prioridad"],
        sede: json["sede"],
        fabricante: json["fabricante"],
        clasificacionRiesgo: json["clasificacionRiesgo"],
        clasificacionBiometrica: json["clasificacionBiometrica"],
        estadoColor: json["estadoColor"],
        estado: json["estado"],
        tipoTecnologia: json["tipoTecnologia"],
        estadoId: json["estadoId"],
        idEquipo: json["idEquipo"],
        sistemaId: json["sistemaId"],
        sistema: json["sistema"],
        marcaId: json["marcaId"],
        sedeId: json["sedeId"],
        tipoTecnologiaId: json["tipoTecnologiaId"],
        fabricanteId: json["fabricanteId"],
        clasificacionBiomedicaId: json["clasificacionBiomedicaId"],
        claseRiesgoId: json["claseRiesgoId"],
        prioridadId: json["prioridadId"],
        ubicacion: json["ubicacion"],
        modelo: json["modelo"],
        serie: json["serie"],
        codigoInternoInventario: json["codigoInternoInventario"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "marca": marca,
        "prioridad": prioridad,
        "sede": sede,
        "fabricante": fabricante,
        "clasificacionRiesgo": clasificacionRiesgo,
        "clasificacionBiometrica": clasificacionBiometrica,
        "estadoColor": estadoColor,
        "estado": estado,
        "tipoTecnologia": tipoTecnologia,
        "estadoId": estadoId,
        "idEquipo": idEquipo,
        "sistemaId": sistemaId,
        "sistema": sistema,
        "marcaId": marcaId,
        "sedeId": sedeId,
        "tipoTecnologiaId": tipoTecnologiaId,
        "fabricanteId": fabricanteId,
        "clasificacionBiomedicaId": clasificacionBiomedicaId,
        "claseRiesgoId": claseRiesgoId,
        "prioridadId": prioridadId,
        "ubicacion": ubicacion,
        "modelo": modelo,
        "serie": serie,
        "codigoInternoInventario": codigoInternoInventario,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}

class Especificaciones {
    final List<EspecificacionesDatum>? data;

    Especificaciones({
        this.data,
    });

    factory Especificaciones.fromJson(Map<String, dynamic> json) => Especificaciones(
        data: json["data"] == null ? [] : List<EspecificacionesDatum>.from(json["data"]!.map((x) => EspecificacionesDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class EspecificacionesDatum {
    final int? idEspecificacion;
    final int? value;
    final int? idEquipo;
    final int? tipoEspecificacionId;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final TipoEspecificacion? tipoEspecificacion;

    EspecificacionesDatum({
        this.idEspecificacion,
        this.value,
        this.idEquipo,
        this.tipoEspecificacionId,
        this.createdAt,
        this.updatedAt,
        this.tipoEspecificacion,
    });

    factory EspecificacionesDatum.fromJson(Map<String, dynamic> json) => EspecificacionesDatum(
        idEspecificacion: json["idEspecificacion"],
        value: json["value"],
        idEquipo: json["idEquipo"],
        tipoEspecificacionId: json["tipoEspecificacionId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        tipoEspecificacion: json["tipoEspecificacion"] == null ? null : TipoEspecificacion.fromJson(json["tipoEspecificacion"]),
    );

    Map<String, dynamic> toJson() => {
        "idEspecificacion": idEspecificacion,
        "value": value,
        "idEquipo": idEquipo,
        "tipoEspecificacionId": tipoEspecificacionId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "tipoEspecificacion": tipoEspecificacion?.toJson(),
    };
}

class TipoEspecificacion {
    final int? id;
    final String? name;
    final String? unidadMedida;

    TipoEspecificacion({
        this.id,
        this.name,
        this.unidadMedida,
    });

    factory TipoEspecificacion.fromJson(Map<String, dynamic> json) => TipoEspecificacion(
        id: json["id"],
        name: json["name"],
        unidadMedida: json["unidadMedida"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "unidadMedida": unidadMedida,
    };
}

class LastAcion {
    final int? id;
    final String? numeroCertificado;
    final int? idEquipo;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    LastAcion({
        this.id,
        this.numeroCertificado,
        this.idEquipo,
        this.createdAt,
        this.updatedAt,
    });

    factory LastAcion.fromJson(Map<String, dynamic> json) => LastAcion(
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

class Mantenimientos {
    final List<MantenimientosDatum>? data;

    Mantenimientos({
        this.data,
    });

    factory Mantenimientos.fromJson(Map<String, dynamic> json) => Mantenimientos(
        data: json["data"] == null ? [] : List<MantenimientosDatum>.from(json["data"]!.map((x) => MantenimientosDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class MantenimientosDatum {
    final int? id;
    final int? idEquipo;
    final String? tecnicoId;
    final String? descripcion;
    final String? caracteristicas;
    final String? recomendacionesFabricante;
    final DateTime? fechaInicio;
    final dynamic fechaFin;
    final int? estadoId;
    final DateTime? createdAt;
    final Tecnico? tecnico;
    final Estado? estado;

    MantenimientosDatum({
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
        this.estado,
    });

    factory MantenimientosDatum.fromJson(Map<String, dynamic> json) => MantenimientosDatum(
        id: json["id"],
        idEquipo: json["idEquipo"],
        tecnicoId: json["tecnicoId"],
        descripcion: json["descripcion"],
        caracteristicas: json["caracteristicas"],
        recomendacionesFabricante: json["recomendacionesFabricante"],
        fechaInicio: json["fechaInicio"] == null ? null : DateTime.parse(json["fechaInicio"]),
        fechaFin: json["fechaFin"],
        estadoId: json["estadoId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        tecnico: json["tecnico"] == null ? null : Tecnico.fromJson(json["tecnico"]),
        estado: json["estado"] == null ? null : Estado.fromJson(json["estado"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idEquipo": idEquipo,
        "tecnicoId": tecnicoId,
        "descripcion": descripcion,
        "caracteristicas": caracteristicas,
        "recomendacionesFabricante": recomendacionesFabricante,
        "fechaInicio": "${fechaInicio!.year.toString().padLeft(4, '0')}-${fechaInicio!.month.toString().padLeft(2, '0')}-${fechaInicio!.day.toString().padLeft(2, '0')}",
        "fechaFin": fechaFin,
        "estadoId": estadoId,
        "createdAt": createdAt?.toIso8601String(),
        "tecnico": tecnico?.toJson(),
        "estado": estado?.toJson(),
    };
}

class Estado {
    final int? id;
    final String? nombre;
    final String? color;

    Estado({
        this.id,
        this.nombre,
        this.color,
    });

    factory Estado.fromJson(Map<String, dynamic> json) => Estado(
        id: json["id"],
        nombre: json["nombre"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "color": color,
    };
}

class Tecnico {
    final String? id;
    final String? nombres;
    final String? apellidos;
    final String? userName;

    Tecnico({
        this.id,
        this.nombres,
        this.apellidos,
        this.userName,
    });

    factory Tecnico.fromJson(Map<String, dynamic> json) => Tecnico(
        id: json["id"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        userName: json["userName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombres": nombres,
        "apellidos": apellidos,
        "userName": userName,
    };
}
