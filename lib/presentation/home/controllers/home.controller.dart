import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../domain/entity/entity_customer/add_customer_request.dart';
import '../../../domain/entity/entity_customer/customer_request.dart';
import '../../../domain/entity/entity_customer/customer_response.dart';
import '../../../infrastructure/dal/daos/dao.dart';

class HomeController extends GetxController {
  final namaController = TextEditingController();
  final noHpController = TextEditingController();
  // CustomerRequest args = Get.arguments;
  List<Customers> customerList = [];
  bool isShowPass = false;
  bool loading = false;
  bool loadingListCustomer = false;
  bool loadingAddCustomer = false;

  @override
  void onInit() {
    super.onInit();

    getListCustomer(true);
  }

  Future<void> getListCustomer(bool isRefresh) async {
    loadingListCustomer = true;
    update();

    CustomerRequest params = CustomerRequest(
      companyId: 1,
    );

    try {
      CustomerResponse res = await Dao().listCustomer(params);
      if (res.success == true) {
        if (isRefresh) {
          customerList.clear();
          update();
        }

        customerList.addAll(res.customers as Iterable<Customers>);
        loadingListCustomer = false;
        update();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Failed get list data");
      }

      loadingListCustomer = false;
      update();
    }
  }

  Future<void> addCustomer() async {
    loadingAddCustomer = true;
    update();

    var params = AddCustomerRequest(
      companyId: 1,
      nama: namaController.text,
      nohp: noHpController.text,
    );

    var res = await Dao().addCustomer(params);

    try {
      loadingAddCustomer = false;
      update();

      Fluttertoast.showToast(msg: res.message!);
      getListCustomer(true);
      // Get.back();
    } catch (e) {
      loadingAddCustomer = false;
      update();

      Fluttertoast.showToast(msg: "Gagal");
    }
  }

  Future<void> logout() async {
    loading = true;
    update();
    try {
      await Dao.logout();
      loading = false;
      update();
    } catch (e) {
      loading = false;
      update();
      print(e);
    }
  }

  showModal(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Data Customer'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(4),
                  prefixIcon: const Icon(
                    Icons.person,
                    size: 24,
                  ),
                  hintText: "Nama lengkap",
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
              const SizedBox(height: 8.0),
              TextField(
                controller: noHpController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(4),
                  prefixIcon: const Icon(
                    Icons.person,
                    size: 24,
                  ),
                  hintText: "Nomor handphone",
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
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back();
                namaController.clear();
                noHpController.clear();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
                addCustomer();

                namaController.clear();
                noHpController.clear();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  List<String> convertStringToList(String data) {
    return data.split(',').map((item) => item.trim()).toList();
  }
}
