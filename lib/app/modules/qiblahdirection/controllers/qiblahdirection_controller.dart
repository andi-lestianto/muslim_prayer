// ignore_for_file: unnecessary_overrides

import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:get/get.dart';

class QiblahdirectionController extends GetxController {
  final deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
