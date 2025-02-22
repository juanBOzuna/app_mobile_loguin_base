import 'package:equipos_lab_qr_scan/controllers/equipos_controller.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/content_equipos/CONTENT_EQUIPOS.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/content_equipos/widget_modal_ver_mantenimiento.dart';
import 'package:flutter/material.dart';

class CardMantenimientoWidget extends StatelessWidget {
  final String id;
  final String nombre;
  final String responsable;
  final String fechaInicio;
  final String fechaFin;
  final String estado;
  final String color;
  final EquiposController equiposController;

  const CardMantenimientoWidget({
    super.key,
    required this.nombre,
    required this.responsable,
    required this.fechaInicio,
    required this.fechaFin,
    required this.estado,
    required this.color,
    required this.equiposController,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    Size sizeAct = MediaQuery.of(context).size;
    // return Obx(() => Card(
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: 220,
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nombre,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF707070),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Responsable: ",
                          style: TextStyle(
                            color: Color(0xFF707070),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(
                          text: responsable,
                          style: const TextStyle(
                            color: Color(0xFF707070),
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Fecha de inicio: ",
                          style: TextStyle(
                            color: Color(0xFF707070),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(
                          text: fechaInicio,
                          style: const TextStyle(
                            color: Color(0xFF707070),
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Fecha de fin: ",
                          style: TextStyle(
                            color: Color(0xFF707070),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(
                          text: fechaFin,
                          style: const TextStyle(
                            color: Color(0xFF707070),
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                        backgroundColor: Color(
                            int.parse(color.substring(1), radix: 16) +
                                0xFF000000)),
                    child: Text(
                      estado,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  !(fechaFin == 'Aun no ha finalizado')
                      ? IconButton(
                          onPressed: () {
                            equiposController.fetchMantenimiento(id);
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => SafeArea(
                                      child: VerMantenimientoModalWidget(
                                          sizeAct: sizeAct,
                                          equiposController: equiposController),
                                    ));
                          },
                          iconSize: 30,
                          icon: !(fechaFin == 'Aun no ha finalizado')
                              ? const Icon(
                                  Icons.remove_red_eye_sharp,
                                )
                              : const SizedBox.shrink(),
                          color: Colors.red,
                        )
                      : const SizedBox.shrink(),
                ],
              )
            ],
          ),
        ),
      ),
      // ));
    );
  }
}
