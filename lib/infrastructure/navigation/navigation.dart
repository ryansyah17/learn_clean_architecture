import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:learn_clean_architecture/presentation/home/controllers/home.controller.dart';
import 'package:learn_clean_architecture/presentation/navbar/mainpage_view.dart';
import 'package:learn_clean_architecture/presentation/pengeluaran/controllers/pengeluaran.controller.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
      name: Routes.DETAIL,
      page: () => const DetailScreen(),
      binding: DetailControllerBinding(),
    ),
    GetPage(
      name: Routes.NAVBAR,
      page: () => const NavbarScreen(),
      binding: NavbarControllerBinding(),
    ),
    GetPage(
        name: Routes.MAINPAGE,
        page: () => const MainPageView(
              index: 0,
              initialPage: 0,
            ),
        binding: BindingsBuilder(() {
          Get.put(HomeController());
          Get.put(PengeluaranController());
        })),
    GetPage(
      name: Routes.PESANAN,
      page: () => const PesananScreen(),
      binding: PesananControllerBinding(),
    ),
    GetPage(
      name: Routes.PENGELUARAN,
      page: () => const PengeluaranScreen(),
      binding: PengeluaranControllerBinding(),
    ),
  ];
}
