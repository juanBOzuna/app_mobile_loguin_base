import 'package:dio/dio.dart';
import 'package:equipos_lab_qr_scan/controllers/equipos_controller.dart';
import 'package:equipos_lab_qr_scan/controllers/qr_controller.dart';
import 'package:equipos_lab_qr_scan/controllers/scan_section_controller.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/content_equipos/CONTENT_EQUIPOS.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/scan_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetalleEquipos extends StatefulWidget {
  final Qrcontroller qrcontroller;
  final EquiposController equiposController;
  const DetalleEquipos(
      {super.key, required this.qrcontroller, required this.equiposController});

  @override
  State<DetalleEquipos> createState() => _DetalleEquiposState();
}

class _DetalleEquiposState extends State<DetalleEquipos> {
  @override
  void initState() {
    super.initState();
    getEquipo();
  }

  Future<void> getEquipo() async {
    // final response =
    //     await Dio().get('http://192.168.1.74:3000/equipos/viewComplete/1');
    // await widget.equiposController.fetchEquipoData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (widget.qrcontroller.dataIsRead.value == false) {
        return const Center(
          child: Text(
            'No se ha leido nada ',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        );
      } else {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ContentEquipos(
              qrController: widget.qrcontroller,
              equiposController: widget.equiposController,
            ),
          ),
        );
      }
    });
  }
}
