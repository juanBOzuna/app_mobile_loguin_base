import 'package:equipos_lab_qr_scan/presentation/home/home.dart';
import 'package:equipos_lab_qr_scan/presentation/utils/drawer/elements/content_drawer/content_drawer.dart';
import 'package:equipos_lab_qr_scan/presentation/utils/drawer/elements/top_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerGeneral extends StatelessWidget {
  const DrawerGeneral({
    super.key,
    required this.widget,
  });

  final Home widget;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Color(0xFF98e79d),
      // backgroundColor: Color(0xFF314f4d),
      backgroundColor: Color(0xFFfffffff),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              TopDrawer(widget: widget),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              const Divider(
                  height: 1,
                  thickness: 1,
                  // indent: 20,
                  // endIndent: 20,
                  color: Color(0xFF314f4d)),
              // const SizedBox(height: 10),
              ContentDrawer(widget: widget),
            ],
          ),
        ),
      ),
    );
  }
}
