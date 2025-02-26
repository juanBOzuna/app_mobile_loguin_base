import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart' as dio;
import 'package:equipos_lab_qr_scan/controllers/utils/login_dto.dart';
import 'package:equipos_lab_qr_scan/controllers/utils/register_dto.dart';
import 'package:equipos_lab_qr_scan/infraestructure/models/auth/auth_resp_model.dart';
import 'package:equipos_lab_qr_scan/presentation/home/home.dart';
import 'package:equipos_lab_qr_scan/presentation/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:get/get_connect/http/src/multipart/form_data.dart' as fromda;
// No es necesario alias aquí a menos que lo uses explícitamente
class Authcontroller extends GetxController {
  var user =
      User(email: '', name: '', password: '', picture: '', v: 0, id: '').obs;

  var userDto = LoginDto('password', ' username').obs;
  var registerDto = RegisterDto('name', 'email', 'password', null).obs;

  var token = ''.obs;
  var refreshToken = ''.obs;
  var isLogged = false.obs;

  var isCharging = false.obs;
  var isChargingRegister = false.obs;

  Future<void> login() async {
    try {
      isCharging.value = true; // Comienza el cargado

      final response = await dio.Dio()
          .post('http://192.168.1.22:3000/auth/login', data: {
        'email': userDto.value.username,
        'password': userDto.value.password
      });
      user.value = User.fromJson(response.data['user']);
      token.value = response.data['accessToken'];
      refreshToken.value = response.data['refreshToken'];
      isLogged.value = true;
      Get.off(() => const Home());
    } catch (e) {
      if (e is dio.DioException) {
        // Get.defaultDialog(
        //   title: 'Errors',
        //   middleText:
        //       e.response?.data['message'] ?? 'Ocurrió un error desconocido.',
        //   onConfirm: () {
        //     Get.back();
        //   },
        //   confirmTextColor: Colors.white,
        //   textConfirm: 'Aceptar',
        // );

        Get.snackbar('Error',
            e.response?.data['message'] ?? 'Ocurrió un error desconocido.',
            backgroundColor: Colors.red);
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

  Future<void> register() async {
    try {
      isChargingRegister.value = true;

      // Crear FormData
      // final formData = dio.FormData.fromMap({
      //   'name': registerDto.value.name,
      //   'email': registerDto.value.email,
      //   'password': registerDto.value.password,
      //   "picture": registerDto.value.image != null
      //       ? await dio.MultipartFile.fromFile(
      //           registerDto.value.image!.path,
      //           filename:
      //               "profile_${DateTime.now().millisecondsSinceEpoch}.jpg",
      //         )
      //       : null,
      // });

      var data = dio.FormData.fromMap({
        'picture': await dio.MultipartFile.fromFile(
            registerDto.value.image!.path,
            filename: 'profile_${DateTime.now().millisecondsSinceEpoch}.jpg'),
        'name': registerDto.value.name,
        'email': registerDto.value.email,
        'password': registerDto.value.password
      });

      var diod = Dio();
      final response = await diod.request(
        'http://192.168.1.22:3000/auth/signup',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );

      if (response.statusCode == 201) {
        Get.snackbar('Éxito', 'Registro completado',
            backgroundColor: Colors.green);
        Get.off(() => const LoginPage());
      }
    } on dio.DioException catch (e) {
      String errorMessage = 'Error en el registro';
      if (e.response?.statusCode == 409) {
        errorMessage = e.response?.data['message'] ?? 'El usuario ya existe';
      }
      Get.snackbar('Error', errorMessage, backgroundColor: Colors.red);
    } catch (e) {
      Get.snackbar('Error', 'Error desconocido: ${e.toString()}');
    } finally {
      isChargingRegister.value = false;
    }
  }
}
