import 'package:equipos_lab_qr_scan/controllers/equipos_controller.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/content_equipos/widget_card_mantenimiento.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/content_equipos/CONTENT_EQUIPOS.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MantenimientosSectionWidget extends StatelessWidget {
  final EquiposController equiposController;

  const MantenimientosSectionWidget(
      {super.key, required this.equiposController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (equiposController.mantenimientos.isEmpty) {
        return const Center(child: Text('No hay mantenimientos disponibles'));
      }

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              equiposController.mantenimientos.asMap().entries.map((entry) {
            int index = entry.key;
            var mantenimiento = entry.value;

            return CardMantenimientoWidget(
              id: mantenimiento.id.toString(),
              equiposController: equiposController,
              nombre: 'Mantenimiento #${index + 1}',
              responsable: mantenimiento.tecnico!.nombres ?? 'Sin técnico',
              fechaInicio: mantenimiento.fechaInicio != null
                  ? mantenimiento.fechaInicio.toString()
                  : 'Sin fecha de inicio',
              fechaFin: mantenimiento.fechaFin != null
                  ? mantenimiento.fechaFin.toString()
                  : 'Aun no ha finalizado',
              estado: mantenimiento.estado!.nombre ?? '',
              color: mantenimiento.estado!.color ?? '#c2c2c2',
            );
          }).toList(),
        ),
      );
    });
  }
}
