import 'package:equipos_lab_qr_scan/controllers/authController.dart';
import 'package:equipos_lab_qr_scan/controllers/equipos_controller.dart';
import 'package:equipos_lab_qr_scan/controllers/qr_controller.dart';
import 'package:equipos_lab_qr_scan/controllers/scan_section_controller.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/detalle_equipos_section.dart';
import 'package:equipos_lab_qr_scan/presentation/home/utils/scan_section.dart';
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
  bool _isScanSectionVisible = true;
  late Qrcontroller _qrController;
  late ScanSectionController _scanController;
  late EquiposController _equiposController;
  void _toggleScanSection() =>
      setState(() => _isScanSectionVisible = !_isScanSectionVisible);

  @override
  void initState() {
    super.initState();
    _scanController = Get.put(ScanSectionController());
    _qrController = Get.put(Qrcontroller(_scanController));
    _equiposController = Get.put(EquiposController(_qrController));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        drawer: Drawer(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                // Stack(children: [
                //   Container(
                //     height: 200,
                //     color: Colors.red,
                //   ),
                //   SizedBox(
                //     height: 200,
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(
                //               'Scan Qr 🔍',
                //               style: GoogleFonts.openSans(
                //                   fontSize: 30,
                //                   color: Colors.white,
                //                   wordSpacing: 4),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   )
                // ]),
                Container(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Material(
                        child: InkWell(
                          onTap: () {
                            widget.authController.logout();
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Expanded(child: Icon(Icons.logout, size: 20)),
                                Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
        backgroundColor: _qrController.dataIsRead.value
            ? Colors.white
            : const Color.fromARGB(250, 255, 255, 255),
        appBar: AppBar(
          title: const Text(
            'Scan Qr Equipos Lab',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          elevation: 1,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            // Obx(() {
            //   if (_qrController.dataIsRead.value == false) {
            //     return Positioned.fill(
            //       child: Opacity(
            //         opacity: 0.8,
            //         child: Image.asset(
            //           'assets/fondo_login.png',
            //           fit: BoxFit.none,
            //         ),
            //       ),
            //     );
            //   } else {
            //     return const SizedBox.shrink();
            //   }
            // }),
            DetalleEquipos(
                equiposController: _equiposController,
                qrcontroller: _qrController),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                child: Obx(
                  () => _scanController.view.value
                      ? ScanSection(
                          key: const ValueKey('ScanSection'),
                          toggleScanSection: _toggleScanSection)
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            key: const ValueKey('IconUp'),
                            onTap: () => _scanController.setView(true),
                            child: const Icon(Icons.keyboard_arrow_up,
                                size: 30, color: Colors.black),
                          ),
                        ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 20,
              child: Obx(
                () => _qrController.dataIsRead.value
                    ? Row(
                        children: [
                          FloatingActionButton.small(
                            onPressed: () {
                              _qrController.cleanData();
                              _scanController.setView(true);
                            },
                            backgroundColor:
                                const Color.fromARGB(255, 248, 88, 88),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(
                              Icons.cancel_outlined,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                          // const SizedBox(width: ),
                          FloatingActionButton.small(
                            onPressed: () {
                              _equiposController.fetchEquipo(
                                  _qrController.contenidoLeido.value);
                            },
                            backgroundColor:
                                const Color.fromARGB(255, 248, 88, 88),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(
                              Icons.refresh,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
