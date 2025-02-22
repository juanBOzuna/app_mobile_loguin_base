import 'package:equipos_lab_qr_scan/controllers/scan_section_controller.dart';
import 'package:get/get.dart';

class Qrcontroller extends GetxController {
  final ScanSectionController _scanSectionController;

  Qrcontroller(this._scanSectionController);

  var dataIsRead = false.obs;
  var contenidoLeido = '-1'.obs;

  void setDataIsRead(String id) {
    dataIsRead.value = true;
    contenidoLeido.value = id;
  }

  void cleanData() {
    dataIsRead.value = false;
    contenidoLeido.value = '-1';

    _scanSectionController.setView(true);
  }
}
