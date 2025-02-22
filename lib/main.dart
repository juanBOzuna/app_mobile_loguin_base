import 'package:equipos_lab_qr_scan/config/theme/app_theme.dart';
import 'package:equipos_lab_qr_scan/controllers/authController.dart';
import 'package:equipos_lab_qr_scan/presentation/home/home.dart';
import 'package:equipos_lab_qr_scan/presentation/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(Authcontroller());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Authcontroller authcontroller = Get.find<Authcontroller>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme().getTheme(),
      home: Obx(() {
        return authcontroller.isLogged.value
            ? Home(
                authController: authcontroller,
              )
            : const LoginPage();
      }),
    );
  }
}
