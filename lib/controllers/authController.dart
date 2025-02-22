import 'package:dio/dio.dart';
import 'package:equipos_lab_qr_scan/controllers/utils/login_dto.dart';
import 'package:equipos_lab_qr_scan/infraestructure/models/auth/auth_resp_model.dart';
import 'package:equipos_lab_qr_scan/presentation/home/home.dart';
import 'package:equipos_lab_qr_scan/presentation/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authcontroller extends GetxController {
  var user = User(
          apellidos: '',
          fullname: '',
          nombres: '',
          rol: '',
          rolId: 0,
          userName: '',
          id: '')
      .obs;
  var userDto = LoginDto('password', ' username').obs;

  var token = ''.obs;
  var isLogged = false.obs;

  var isCharging = false.obs;

  Future<void> login() async {
    try {
      isCharging.value = true; // Comienza el cargado

      final response = await Dio()
          .post('https://labusi-back.onrender.com/Authentication/login', data: {
        'userName': userDto.value.username,
        'password': userDto.value.password
      });
      user.value = User.fromJson(response.data['user']);
      token.value = response.data['token'];
      isLogged.value = true;
      Get.to(() => Home(authController: Get.find<Authcontroller>()));
    } catch (e) {
      if (e is DioException) {
        Get.defaultDialog(
          title: 'Errors',
          middleText:
              e.response?.data['message'] ?? 'Ocurrió un error desconocido.',
          onConfirm: () {
            Get.back();
          },
          confirmTextColor: Colors.white,
          textConfirm: 'Aceptar',
        );
      } else {
        Get.defaultDialog(
          title: 'Error',
          middleText: 'Ocurrió un error desconocido.',
          onConfirm: () {
            Get.back();
          },
          confirmTextColor: Colors.white,
          textConfirm: 'Aceptar',
        );
        print(e);
      }
    } finally {
      isCharging.value = false;
    }
  }

  void logout() async {
    isLogged.value = false;
    token.value = '';
    Get.to(() => const LoginPage());
  }
}
