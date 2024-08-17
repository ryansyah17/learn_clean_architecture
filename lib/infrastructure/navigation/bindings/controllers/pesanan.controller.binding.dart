import 'package:get/get.dart';

import '../../../../presentation/pesanan/controllers/pesanan.controller.dart';

class PesananControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PesananController>(
      () => PesananController(),
    );
  }
}
