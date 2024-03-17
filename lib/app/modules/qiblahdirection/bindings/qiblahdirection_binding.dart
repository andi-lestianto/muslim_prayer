import 'package:get/get.dart';

import '../controllers/qiblahdirection_controller.dart';

class QiblahdirectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QiblahdirectionController>(
      () => QiblahdirectionController(),
    );
  }
}
