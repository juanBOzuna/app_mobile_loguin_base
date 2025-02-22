import 'package:dio/dio.dart';
import 'package:equipos_lab_qr_scan/controllers/qr_controller.dart';
import 'package:equipos_lab_qr_scan/controllers/utils/mantenimiento_model.dart';
import 'package:equipos_lab_qr_scan/infraestructure/models/equipos/equipos_resp_model.dart';
import 'package:equipos_lab_qr_scan/infraestructure/models/mantenimientos/mantenimientos_resp_model.dart';
import 'package:equipos_lab_qr_scan/infraestructure/models/testeos_general.dart/TestsGeneralResp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EquiposController extends GetxController {
  final Qrcontroller _qrController;

  EquiposController(this._qrController);

  var equipo = Equipo(
    marca: '',
    prioridad: '',
    sede: '',
    fabricante: '',
    clasificacionRiesgo: '',
    clasificacionBiometrica: '',
    estadoColor: '',
    estado: '',
    tipoTecnologia: '',
    estadoId: 0,
    idEquipo: 0,
    sistemaId: 0,
    sistema: '',
    marcaId: 0,
    sedeId: 0,
    tipoTecnologiaId: 0,
    fabricanteId: 0,
    clasificacionBiomedicaId: 0,
    claseRiesgoId: 0,
    prioridadId: 0,
    ubicacion: '',
    modelo: '',
    serie: '',
    codigoInternoInventario: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ).obs;

  var adquisicion = Adquisicion(
    calibracion: 0,
    idAdquisicion: 0,
    idEquipo: 0,
    manual: null,
    manualId: 0,
    modoAdquisicion: null,
    modoAdquisicionId: 0,
    periodicidadMantenimientoMeses: 0,
    proveedor: null,
    proveedorId: 0,
    registroSanitario: '',
    tiempoGarantiaMeses: 0,
    vidaUtilMeses: 0,
    updatedAt: DateTime.now(),
    fechaVencimiento: DateTime.now(),
    fechaInstalacion: DateTime.now(),
    createdAt: DateTime.now(),
    fechaCompra: DateTime.now(),
  ).obs;

  var lastCalibracion = LastAcion(
          createdAt: DateTime.now(),
          id: 0,
          idEquipo: 0,
          numeroCertificado: '',
          updatedAt: DateTime.now())
      .obs;

  var lastCalificacion = LastAcion(
          createdAt: DateTime.now(),
          id: 0,
          idEquipo: 0,
          numeroCertificado: '',
          updatedAt: DateTime.now())
      .obs;

  var lastVerificacion = LastAcion(
          createdAt: DateTime.now(),
          id: 0,
          idEquipo: 0,
          numeroCertificado: '',
          updatedAt: DateTime.now())
      .obs;

  var mantenimientos = <MantenimientosDatum>[].obs;

  var especificaciones = <EspecificacionesDatum>[].obs;

  var isCharging = true.obs;

  var testsGenerals = <TestGeneral>[].obs;

  var isChargingMantenimiento = true.obs;

  var isChargingTestGeneral = true.obs;

  var mantenimientoToDetailSelected = Mantenimiento(
          caracteristicas: '',
          createdAt: DateTime.now(),
          descripcion: '',
          estadoId: 0,
          fechaFin: DateTime.now(),
          fechaInicio: DateTime.now(),
          id: 0,
          idEquipo: 0,
          recomendacionesFabricante: '',
          tecnicoId: '',
          tecnico: Tecnico(apellidos: '', id: '', nombres: '', userName: ''))
      .obs;

  Future<void> fetchEquipo(String id) async {
    try {
      isCharging.value = true; // Comienza el cargado
      final response = await Dio()
          .get('https://labusi-back.onrender.com/equipos/viewComplete/$id');

      equipo.value = Equipo.fromJson(response.data['data']['equipo']);

      adquisicion.value =
          Adquisicion.fromJson(response.data['data']['adquisicion']);

      if (response.data['data']['lastCalibracion'] != null) {
        lastCalibracion.value =
            LastAcion.fromJson(response.data['data']['lastCalibracion']);
      }
      if (response.data['data']['lastCalificacion'] != null) {
        lastCalificacion.value =
            LastAcion.fromJson(response.data['data']['lastCalificacion']);
      }
      if (response.data['data']['lastVerificacion'] != null) {
        lastVerificacion.value =
            LastAcion.fromJson(response.data['data']['lastVerificacion']);
      }

      mantenimientos.value = List<MantenimientosDatum>.from(response
          .data['data']['mantenimientos']['data']
          .map((x) => MantenimientosDatum.fromJson(x)));

      especificaciones.value = List<EspecificacionesDatum>.from(response
          .data['data']['especificaciones']['data']
          .map((x) => EspecificacionesDatum.fromJson(x)));
    } catch (e) {
      if (e is DioException) {
        Get.defaultDialog(
          title: 'Error',
          middleText:
              e.response?.data['message'] ?? 'Ocurrió un error desconocido.',
          onConfirm: () {
            Get.back();
          },
          confirmTextColor: Colors.white,
          textConfirm: 'Aceptar',
        );

        _qrController.cleanData();
      } else {
        Get.defaultDialog(
          title: 'Error',
          middleText: 'Ocurrió un error desconocido.',
          onConfirm: () {
            Get.back();
          },
          confirmTextColor: Colors.white,
          textConfirm: 'Aceptar',
        );

        _qrController.cleanData();
      }
    } finally {
      isCharging.value = false;
    }
  }

  Future<void> fetchMantenimiento(String id) async {
    try {
      isChargingMantenimiento.value = true; // Comienza el cargado
      final response = await Dio()
          .get('https://labusi-back.onrender.com/mantenimiento/byEquipoId/$id');

      testsGenerals.value = List<TestGeneral>.from(
          response.data['data'].map((x) => TestGeneral.fromJson(x)));

      isChargingMantenimiento.value = false;
    } catch (e) {
      if (e is DioException) {
        Get.defaultDialog(
          title: 'Error',
          middleText:
              e.response?.data['message'] ?? 'Ocurrió un error desconocido.',
          onConfirm: () {
            Get.back();
          },
          confirmTextColor: Colors.white,
          textConfirm: 'Aceptar',
        );

        _qrController.cleanData();
      } else {
        Get.defaultDialog(
          title: 'Error',
          middleText: 'Ocurrió un error desconocido.',
          onConfirm: () {
            Get.back();
          },
          confirmTextColor: Colors.white,
          textConfirm: 'Aceptar',
        );

        _qrController.cleanData();
      }
    } finally {
      isChargingMantenimiento.value = false;
    }
  }

  Future<void> fetchAllTestsGeneral(String endpoint) async {
    try {
      isChargingTestGeneral.value = true; // Comienza el cargado
      final response = await Dio().get(
          'http://localhost:3000/"$endpoint"/AllByEquipoId/"${_qrController.contenidoLeido}"');

      mantenimientoToDetailSelected.value =
          Mantenimiento.fromJson(response.data['data']);

      isChargingTestGeneral.value = false;
    } catch (e) {
      if (e is DioException) {
        Get.defaultDialog(
          title: 'Error',
          middleText:
              e.response?.data['message'] ?? 'Ocurrió un error desconocido.',
          onConfirm: () {
            Get.back();
          },
          confirmTextColor: Colors.white,
          textConfirm: 'Aceptar',
        );

        _qrController.cleanData();
      } else {
        Get.defaultDialog(
          title: 'Error',
          middleText: 'Ocurrió un error desconocido.',
          onConfirm: () {
            Get.back();
          },
          confirmTextColor: Colors.white,
          textConfirm: 'Aceptar',
        );

        _qrController.cleanData();
      }
    } finally {
      isChargingTestGeneral.value = false;
    }
  }
}
