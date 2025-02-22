import 'package:equipos_lab_qr_scan/controllers/equipos_controller.dart';
import 'package:equipos_lab_qr_scan/controllers/qr_controller.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/content_equipos/CONTENT_EQUIPOS.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/content_equipos/widget_modal_ver_adquisiciones.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoGeneralWidget extends StatefulWidget {
  final Qrcontroller qrController;
  final EquiposController equiposController;
  const InfoGeneralWidget({
    super.key,
    required this.qrController,
    required this.equiposController,
  });

  @override
  State<InfoGeneralWidget> createState() => _InfoGeneralWidgetState();
}

class _InfoGeneralWidgetState extends State<InfoGeneralWidget> {
  // late EquiposController _equiposController;

  @override
  void initState() {
    super.initState();
    // _equiposController = widget.equiposController;
  }

  @override
  Widget build(BuildContext context) {
    Size sizeAct = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/equipo.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => TextDetailTop(
                  text: widget.equiposController.equipo.value.fabricante
                      .toString())),
              Obx(() => TextDetailTop(
                  text:
                      "${widget.equiposController.equipo.value.marca} - ${widget.equiposController.equipo.value.modelo}")),
              Obx(() => TextDetailTop(
                  text:
                      widget.equiposController.equipo.value.serie.toString())),
              GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => VerAdquisicionesModalWidget(
                            sizeAct: sizeAct,
                            equiposController: widget.equiposController));
                  },
                  child: const TextDetailTop(
                    text: 'Ver adquisicion',
                    color: Colors.red,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
