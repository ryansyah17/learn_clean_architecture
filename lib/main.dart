import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'domain/constant.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'package:learn_clean_architecture/infrastructure/dal/storage/storage.dart'
    as storage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  String? token;
  try {
    token = storage.Storage.getValue(Constant.authToken);
    if (kDebugMode) {
      print("Login token exsist $token");
    }
  } catch (e) {
    if (kDebugMode) {
      print("Catch No login token $e");
    }
  }

  var initialRoute =
      token == null ? await Routes.loginRoute : await Routes.navBarRoute;
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return Main(initialRoute);
      },
    ),
  );
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: Nav.routes,
    );
  }
}
