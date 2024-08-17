import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../domain/constant.dart';
import '../../../domain/entity/entity_auth/login_request.dart';
import '../../../infrastructure/dal/daos/dao.dart';
import 'package:learn_clean_architecture/infrastructure/dal/storage/storage.dart'
    as storage;

import '../../../infrastructure/navigation/routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isShowPass = false;
  bool loading = false;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    loading = false;
    update();

    var params = LoginRequest(
      username: usernameController.text,
      password: passwordController.text,
    );

    var res = await Dao().login(params);

    if (res.success == true) {
      loading = false;
      update();

      storage.Storage.saveValue(Constant.authToken, res.token);

      Fluttertoast.showToast(msg: "Login success");
      Get.offAllNamed(Routes.MAINPAGE);
    } else {
      loading = false;
      update();

      Fluttertoast.showToast(msg: res.message!);
    }
  }
}
