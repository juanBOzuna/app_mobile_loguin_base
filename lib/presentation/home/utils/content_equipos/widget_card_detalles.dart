import 'package:equipos_lab_qr_scan/controllers/equipos_controller.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/content_equipos/CONTENT_EQUIPOS.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardDetallesWidget extends StatelessWidget {
  final EquiposController equiposController;
  const CardDetallesWidget({
    super.key,
    required this.sizeAct,
    required this.equiposController,
  });

  final Size sizeAct;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: SizedBox(
        width: sizeAct.width,
        child: Column(
          children: [
            const Text(
              'DETALLES',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF707070)),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.transparent,
                    width: sizeAct.width / 2.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => TextDetailBottom(
                            boldText: 'Fabricante: ',
                            normalText:
                                '${equiposController.equipo.value.fabricante}')),
                        const Divider(),
                        Obx(() => TextDetailBottom(
                            boldText: 'Sistema: ',
                            normalText:
                                '${equiposController.equipo.value.sistema}')),
                        const Divider(),
                        Obx(() => TextDetailBottom(
                            boldText: 'Clasificacion Biomedica: ',
                            normalText:
                                '${equiposController.equipo.value.clasificacionBiometrica}')),
                      ],
                    ),
                  ),
                  Column(children: [
                    Container(
                      height: 50,
                      width: 2,
                      color: Colors.black45,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 50,
                      width: 2,
                      color: Colors.black45,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 50,
                      width: 2,
                      color: Colors.black45,
                    ),
                  ]),
                  Container(
                    color: Colors.transparent,
                    width: sizeAct.width / 2.8,
                    child: Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: equiposController.especificaciones.value
                              .map((especificacion) => TextDetailBottom(
                                  boldText:
                                      "${especificacion.tipoEspecificacion?.name}: ",
                                  normalText:
                                      "${especificacion.value?.toString()} ${especificacion.tipoEspecificacion!.unidadMedida} "))
                              .toList(),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
