import 'package:equipos_lab_qr_scan/presentation/home/home.dart';
import 'package:equipos_lab_qr_scan/presentation/utils/drawer/elements/content_drawer/menu_animals.dart';
import 'package:equipos_lab_qr_scan/presentation/utils/drawer/elements/content_drawer/menu_logout.dart';
import 'package:equipos_lab_qr_scan/presentation/utils/drawer/elements/content_drawer/menu_movimientos.dart';
import 'package:equipos_lab_qr_scan/presentation/utils/drawer/elements/content_drawer/menu_orde%C3%B1os.dart';
import 'package:flutter/material.dart';

class ContentDrawer extends StatelessWidget {
  const ContentDrawer({
    super.key,
    required this.widget,
  });

  final Home widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          MenuItemAnimalsWidget(widget: widget),
          const SizedBox(height: 10),
          MenuItemOrdenosWidget(widget: widget),
          const SizedBox(height: 10),
          MenuItemMovimientosWidget(widget: widget),
          const SizedBox(height: 10),
          MenuItemLogoutWidget(widget: widget),
          const SizedBox(height: 10),
          ExpansionTile(
            collapsedIconColor: Color(0xFF314f4d),
            backgroundColor: Color(0xFFfffffff),
            textColor: Color(0xFF314f4d),
            leading: const Icon(
              Icons.settings,
              color: Color(0xFF314f4d),
            ),
            collapsedBackgroundColor: Color(0xFFfffffff),
            title: const Text(
              "Parametros",
              style: TextStyle(fontSize: 17, color: Color(0xFF314f4d)),
            ),
            children: [
              ListTile(
                leading: const Icon(
                  Icons.report_problem,
                  color: Color(0xFF314f4d),
                ),
                title: const Text(
                  "Tipos de incidentes",
                  style: TextStyle(color: Color(0xFF314f4d)),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.tune, color: Color(0xFF314f4d)),
                title: const Text(
                  "estados de productos",
                  style: TextStyle(color: Color(0xFF314f4d)),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.tune,
                  color: Color(0xFF314f4d),
                ),
                title: const Text(
                  "estados de animales",
                  style: TextStyle(color: Color(0xFF314f4d)),
                ),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
