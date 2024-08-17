import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                formLogin(context),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget formLogin(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller.usernameController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(4),
            prefixIcon: const Icon(
              Icons.person,
              size: 24,
            ),
            hintText: "Username",
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller.passwordController,
          obscureText: !controller.isShowPass,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(4),
            prefixIcon: const Icon(
              Icons.person,
              size: 24,
            ),
            hintText: "Password",
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => controller.login(),
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: const Size.fromHeight(42),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Colors.blue),
            ),
          ),
          child: controller.loading
              ? const SizedBox(
                  child: LinearProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(
                  "Login",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
        )
      ],
    );
  }
}
