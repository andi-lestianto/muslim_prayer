import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/qiblahdirection/bindings/qiblahdirection_binding.dart';
import '../modules/qiblahdirection/views/qiblahdirection_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.QIBLAHDIRECTION,
      page: () => const QiblahdirectionView(),
      binding: QiblahdirectionBinding(),
    ),
  ];
}
