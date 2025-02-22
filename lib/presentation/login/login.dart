import 'package:equipos_lab_qr_scan/controllers/authController.dart';
import 'package:equipos_lab_qr_scan/controllers/utils/login_dto.dart';
import 'package:equipos_lab_qr_scan/presentation/home/home.dart';
import 'package:equipos_lab_qr_scan/presentation/login/utils/register/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Authcontroller _authcontroller;

  @override
  void initState() {
    super.initState();
    _authcontroller = Get.put(Authcontroller());
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String nombreValue;
  late String passwordValue;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: Opacity(
          //     opacity: 0.8,
          //     child: Image.asset(
          //       'assets/fondo_login.png',
          //       fit: BoxFit.none,
          //     ),
          //   ),
          // ),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hola De nuevo! 👋',
                        style: GoogleFonts.openSans(
                            color: const Color.fromARGB(255, 58, 158, 74),
                            fontSize: 32,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.63,
                        child: Text(
                          'Bienvenido al sistema de escaneo \n de equipos del labratorio!',
                          style: GoogleFonts.openSans(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 50.0, left: 10, right: 10),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color.fromARGB(20, 0, 0, 0),
                                hintText: 'Ingrese Su Usuario',
                                labelText: 'Usuario',
                                prefixIcon: const Icon(Icons.person_2_outlined,
                                    color: Color.fromARGB(255, 58, 158, 74)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 58, 158, 74),
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(80, 58, 158, 74),
                                    width: 1,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 20.0),
                                hintStyle:
                                    GoogleFonts.openSans(color: Colors.black),
                                labelStyle:
                                    GoogleFonts.openSans(color: Colors.black),
                              ),
                              style: const TextStyle(fontSize: 16),
                              onSaved: (name) {
                                _authcontroller.userDto.value.username =
                                    name ?? '';
                              },
                              validator: (name) {
                                if (name!.isEmpty) {
                                  return "LLene este campo ";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color.fromARGB(20, 0, 0, 0),
                                  hintText: 'Ingrese Su Contraseña',
                                  labelText: 'Contraseña',
                                  icon: const Icon(
                                    Icons.lock_open_outlined,
                                    color: Color.fromARGB(146, 58, 158, 74),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(146, 58, 158, 74),
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(80, 58, 158, 74),
                                      width: 1,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 20.0),
                                  hintStyle:
                                      GoogleFonts.openSans(color: Colors.black),
                                  labelStyle:
                                      GoogleFonts.openSans(color: Colors.black),
                                ),
                                style: const TextStyle(fontSize: 16),
                                onSaved: (pass) {
                                  _authcontroller.userDto.value.password =
                                      pass ?? '';
                                },
                                validator: (pass) {
                                  if (pass!.isEmpty) {
                                    return "LLene este campo ";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          Obx(() => _authcontroller.isCharging.value
                              ? const CircularProgressIndicator()
                              : Column(
                                  children: [
                                    LoginButton(
                                      authcontroller: _authcontroller,
                                      size: size,
                                      formKey: formKey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 25),
                                      child: GestureDetector(
                                        onTap: () =>
                                            Get.to(() => const RegisterPage()),
                                        child: Text(
                                          'Registrarme 👉',
                                          style: GoogleFonts.openSans(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromARGB(
                                                255, 58, 158, 74),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Authcontroller authcontroller;
  final GlobalKey<FormState> formKey;
  final Size size;
  const LoginButton(
      {super.key,
      required this.authcontroller,
      required this.size,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: SizedBox(
        width: size.width * 1,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            backgroundColor: const Color.fromARGB(255, 58, 158, 74),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 2,
          ),
          onPressed: () {
            login(formKey);
          },
          child: Text('Iniciar Sesión',
              style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }

  login(GlobalKey<FormState> formKey) {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      formKey.currentState!.save();
      authcontroller.login();
    }
  }
}
