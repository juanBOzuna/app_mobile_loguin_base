import 'package:equipos_lab_qr_scan/controllers/qr_controller.dart';
import 'package:equipos_lab_qr_scan/controllers/scan_section_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanSection extends StatefulWidget {
  final VoidCallback toggleScanSection;
  const ScanSection({super.key, required this.toggleScanSection});
  @override
  State<ScanSection> createState() => _ScanSectionState();
}

class _ScanSectionState extends State<ScanSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ScanSectionController _scanController;
  late Animation<double> _scaleAnimation;
  late Qrcontroller _qrcontroller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // Duración de la animación
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _scanController = Get.put(ScanSectionController());
    _qrcontroller = Get.put(Qrcontroller(_scanController));
  }

  @override
  void dispose() {
    _controller.dispose(); // Limpiar el controlador
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Obx(() => Card(
          color: _qrcontroller.dataIsRead.value
              ? Colors.white
              : Colors.transparent,
          elevation: _qrcontroller.dataIsRead.value ? 2 : 0,
          child: SizedBox(
            width: screenWidth * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      _scanController.setView(false);
                      _controller.forward().then((_) {
                        _controller.reverse();
                      });
                    },
                    child: Column(
                      children: [
                        GestureDetector(
                          child: const Text(
                            'Aprete el botón para escanear un QR',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ScaleTransition(
                          scale: _scaleAnimation,
                          child: const Icon(Icons.keyboard_arrow_down,
                              size: 30, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      scanQr();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: const Color(0xFFFF9292),
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Icon(
                      Icons.qr_code_scanner,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> scanQr() async {
    var status = await Permission.camera.request();
    if (!status.isGranted) {
      return;
    }
    String scannerRes = '';

    try {
      scannerRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff9292', 'Cancelar', true, ScanMode.QR);

      _qrcontroller.setDataIsRead(scannerRes);
      _scanController.setView(false);
    } catch (e) {
      scannerRes = 'Fallo al obtener la version de la plataforma';
    }
  }
}
