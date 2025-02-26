import 'package:equipos_lab_qr_scan/controllers/authController.dart';
import 'package:equipos_lab_qr_scan/presentation/utils/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  final Authcontroller authController;
  const Home({super.key, required this.authController});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerGeneral(widget: widget),
    );
  }
}
