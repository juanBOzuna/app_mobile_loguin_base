import 'package:equipos_lab_qr_scan/controllers/equipos_controller.dart';
import 'package:equipos_lab_qr_scan/controllers/qr_controller.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/content_equipos/CardTesteos.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/content_equipos/widget_card_detalles.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/content_equipos/widget_info_general.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/content_equipos/widget_mantenimientos_section.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentEquipos extends StatefulWidget {
  final Qrcontroller qrController;
  final EquiposController equiposController;

  const ContentEquipos(
      {super.key, required this.qrController, required this.equiposController});

  @override
  State<ContentEquipos> createState() => _ContentEquiposState();
}

class _ContentEquiposState extends State<ContentEquipos> {
  @override
  void initState() {
    super.initState();
    widget.equiposController
        .fetchEquipo(widget.qrController.contenidoLeido.value);
  }

  @override
  Widget build(BuildContext context) {
    Size sizeAct = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        color: Colors.transparent,
        child: Obx(
          () => widget.equiposController.isCharging.value == true
              ? const Center(
                  child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                ))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoGeneralWidget(
                      qrController: widget.qrController,
                      equiposController: widget.equiposController,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(),
                    const SizedBox(height: 15),
                    // const Text(
                    //   ' MANTENIMIENTOS',
                    //   style: TextStyle(
                    //       fontSize: 17,
                    //       fontWeight: FontWeight.bold,
                    //       color: Color(0xFF707070)),
                    // ),
                    // const SizedBox(height: 15),
                    MantenimientosSectionWidget(
                      equiposController: widget.equiposController,
                    ),

                    // const SizedBox(height: 20),
                    // CardTesteosWidget(
                    //     equiposController: widget.equiposController,
                    //     sizeAct: sizeAct,
                    //     linkFetchAll: '',
                    //     ultimaFecha: '2025-5-10',
                    //     certificado: '5'),

                    const SizedBox(height: 20),
                    CardDetallesWidget(
                      sizeAct: sizeAct,
                      equiposController: widget.equiposController,
                    ),
                    const SizedBox(height: 20),

                    widget.equiposController.lastCalibracion.value.id != 0
                        ? CardTesteosWidget(
                            title: 'Calibracion',
                            equiposController: widget.equiposController,
                            sizeAct: sizeAct,
                            linkFetchAll: '',
                            ultimaFecha: widget.equiposController
                                .lastCalibracion.value.updatedAt
                                .toString(),
                            certificado: widget.equiposController
                                    .lastCalibracion.value.numeroCertificado ??
                                '',
                          )
                        : Container(),
                    widget.equiposController.lastCalificacion.value.id != 0
                        ? CardTesteosWidget(
                            title: 'Calificacion',
                            equiposController: widget.equiposController,
                            sizeAct: sizeAct,
                            linkFetchAll: '',
                            ultimaFecha: widget.equiposController
                                .lastCalificacion.value.updatedAt
                                .toString(),
                            certificado: widget.equiposController
                                    .lastCalificacion.value.numeroCertificado ??
                                '',
                          )
                        : Container(),
                    widget.equiposController.lastVerificacion.value.id != 0
                        ? CardTesteosWidget(
                            title: 'Verificacion',
                            equiposController: widget.equiposController,
                            sizeAct: sizeAct,
                            linkFetchAll: '',
                            ultimaFecha: widget.equiposController
                                .lastVerificacion.value.updatedAt
                                .toString(),
                            certificado: widget.equiposController
                                    .lastVerificacion.value.numeroCertificado ??
                                '',
                          )
                        : Container(),
                  ],
                ),
        ),
      ),
    );
  }
}

class TextDetailTop extends StatelessWidget {
  final String text;
  final Color color;
  const TextDetailTop(
      {super.key, required this.text, this.color = const Color(0xFF707070)});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 19),
      softWrap: true,
    );
  }
}

class TextDetailBottom extends StatelessWidget {
  final String boldText;
  final String normalText;

  const TextDetailBottom({
    super.key,
    required this.boldText,
    required this.normalText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: boldText,
                style: const TextStyle(
                  color: Color(0xFF707070),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: normalText,
                style: const TextStyle(
                  color: Color(0xFF707070),
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
