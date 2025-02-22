import 'package:get/get.dart';

class ScanSectionController extends GetxController {
  var view = true.obs;

  void setView(bool status) {
    view.value = status;
  }
}
