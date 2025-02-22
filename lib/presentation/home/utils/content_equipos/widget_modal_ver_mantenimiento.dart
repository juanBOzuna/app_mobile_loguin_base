import 'package:equipos_lab_qr_scan/controllers/equipos_controller.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/content_equipos/CONTENT_EQUIPOS.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VerMantenimientoModalWidget extends StatelessWidget {
  final EquiposController equiposController;
  const VerMantenimientoModalWidget(
      {super.key, required this.sizeAct, required this.equiposController});

  final Size sizeAct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Info Del Mantenimiento',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/proveedor.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => TextDetailTop(
                          text: equiposController.mantenimientoToDetailSelected
                              .value.tecnico!.nombres
                              .toString())),
                      Obx(() => TextDetailTop(
                          text: equiposController.mantenimientoToDetailSelected
                              .value.tecnico!.apellidos
                              .toString())),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              Container(
                width: sizeAct.width,
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Recomendaciones',
                                style: GoogleFonts.openSans(fontSize: 20)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 5),
                              child: Container(
                                  width: sizeAct.width * 0.7,
                                  child: Obx(() => Text(
                                        equiposController
                                                .mantenimientoToDetailSelected
                                                .value
                                                .recomendacionesFabricante ??
                                            '',
                                        style:
                                            GoogleFonts.openSans(fontSize: 15),
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.start,
                                      ))),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Descripcion',
                              style: GoogleFonts.openSans(fontSize: 20),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 5),
                              child: Container(
                                width: sizeAct.width * 0.7,
                                child: Obx(() => Text(
                                      equiposController
                                              .mantenimientoToDetailSelected
                                              .value
                                              .recomendacionesFabricante ??
                                          '',
                                      style: GoogleFonts.openSans(fontSize: 15),
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.end,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Caracteristicas',
                                style: GoogleFonts.openSans(fontSize: 20)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 5),
                              child: Container(
                                  width: sizeAct.width * 0.7,
                                  child: Obx(
                                    () => Text(
                                      equiposController
                                              .mantenimientoToDetailSelected
                                              .value
                                              .caracteristicas ??
                                          '',
                                      style: GoogleFonts.openSans(fontSize: 15),
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.start,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
