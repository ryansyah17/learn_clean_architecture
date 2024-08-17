import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/pesanan.controller.dart';

class PesananScreen extends GetView<PesananController> {
  const PesananScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PesananScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PesananScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
