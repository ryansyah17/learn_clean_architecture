import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:learn_clean_architecture/domain/entity/entity_pengeluaran/pengeluaran_request.dart';
import 'package:learn_clean_architecture/infrastructure/dal/daos/dao.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/entity/entity_pengeluaran/pengeluaran_response.dart';

class PengeluaranController extends GetxController {
  final tanggalController = TextEditingController();
  final totalController = TextEditingController();
  final deskripsiController = TextEditingController();
  Rx<File?> image = Rx<File?>(null);
  List<Pengeluaran> pengeluaranList = [];

  bool loadingListPengeluaran = false;

  @override
  void onInit() {
    super.onInit();

    getListPengeluaran(true);
  }

  Future<void> getListPengeluaran(bool isRefresh) async {
    loadingListPengeluaran = true;
    update();
    PengeluaranRequest params = PengeluaranRequest(companyId: 1);
    try {
      PengeluaranResponse res = await Dao().listPengeluaran(params);
      if (res.success == true) {
        if (isRefresh) {
          pengeluaranList.clear();
          update();
        }

        pengeluaranList.addAll(res.pengeluaran as Iterable<Pengeluaran>);
        loadingListPengeluaran = false;
        update();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Failed get list data");
      }

      loadingListPengeluaran = false;
      update();
    }
  }

  String formatDate(String dateStr) {
    DateTime parsedDate = DateTime.parse(dateStr);
    String formattedDate = DateFormat('dd MMMM yyyy, HH:mm').format(parsedDate);

    return formattedDate;
  }

  Future<void> getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 25);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    } else {
      print('No image selected.');
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
                controller: tanggalController,
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
                controller: totalController,
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
              const SizedBox(height: 8.0),
              TextField(
                controller: deskripsiController,
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
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Obx(
                    () {
                      if (image.value == null) {
                        return Container(
                          width: 18.w,
                          height: 18.w,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                          ),
                        );
                      } else {
                        return SizedBox(
                          width: 18.w,
                          height: 18.w,
                          child: Image.file(
                            image.value!,
                            fit: BoxFit.cover,
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          getImageFromCamera();
                        },
                        child: Container(
                          width: 30.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.w),
                            color: Colors.amber,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                                color: Colors.grey[300]!,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Pilih Foto',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Obx(() {
                        if (image.value == null) {
                          return const Text(
                            '#Belum ada Bukti',
                          );
                        } else {
                          return SizedBox(
                            width: 70.w,
                            child: Text(
                              image.value!.path.split('/').last,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }
                      })
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back();
                tanggalController.clear();
                totalController.clear();
                deskripsiController.clear();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Get.back();

                tanggalController.clear();
                totalController.clear();
                deskripsiController.clear();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
