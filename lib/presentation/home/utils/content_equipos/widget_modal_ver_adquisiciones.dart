import 'package:equipos_lab_qr_scan/controllers/equipos_controller.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/content_equipos/CONTENT_EQUIPOS.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerAdquisicionesModalWidget extends StatelessWidget {
  final EquiposController equiposController;
  const VerAdquisicionesModalWidget(
      {super.key, required this.sizeAct, required this.equiposController});

  final Size sizeAct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adquisicion del equipo',
          style: TextStyle(color: Color(0xff707070), fontSize: 25),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Divider(height: 1),
              const SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: sizeAct.width * 0.50,
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Detalles',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF707070)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() => TextDetailBottom(
                                    boldText: 'Commpra: ',
                                    normalText: equiposController
                                            .adquisicion.value.fechaCompra
                                            ?.toString() ??
                                        '',
                                  )),
                              Obx(() => TextDetailBottom(
                                    boldText: 'Instalacion: ',
                                    normalText: equiposController
                                            .adquisicion.value.fechaInstalacion
                                            ?.toString() ??
                                        '',
                                  )),
                              Obx(() => TextDetailBottom(
                                    boldText: 'Vencimiento: ',
                                    normalText: equiposController
                                            .adquisicion.value.fechaVencimiento
                                            ?.toString() ??
                                        '',
                                  )),
                              Obx(() => TextDetailBottom(
                                    boldText: 'Garantia: ',
                                    normalText:
                                        '${equiposController.adquisicion.value.tiempoGarantiaMeses} Meses',
                                  )),
                              Obx(() => TextDetailBottom(
                                    boldText: 'Reg. Sanitario: ',
                                    normalText:
                                        '${equiposController.adquisicion.value.registroSanitario}',
                                  )),
                              Obx(() => TextDetailBottom(
                                    boldText: 'Reg. Sanitario: ',
                                    normalText: equiposController.adquisicion
                                                .value.calibracion ==
                                            1
                                        ? 'Si'
                                        : 'No',
                                  )),
                              Obx(() => TextDetailBottom(
                                  boldText: 'Modo Adquisicion: ',
                                  normalText:
                                      '${equiposController.adquisicion.value.modoAdquisicion!.nombre}')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: sizeAct.width * 0.40,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        const Text(
                          'Proveedor',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF707070)),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/proveedor.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Obx(() => TextDetailTop(
                            text: equiposController
                                    .adquisicion.value.proveedor!.nombre ??
                                '')),
                        Obx(() => TextDetailTop(
                            text: equiposController
                                    .adquisicion.value.proveedor!.telefono ??
                                '')),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
