import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'controllers/pengeluaran.controller.dart';
import 'widgets/custom_card_pengeluaran.dart';

class PengeluaranScreen extends GetView<PengeluaranController> {
  const PengeluaranScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PengeluaranController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Pengeluaran'),
          ),
          body: RefreshIndicator(
            onRefresh: () => Future.sync(
              () => controller.getListPengeluaran(true),
            ),
            child: controller.loadingListPengeluaran
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.blue,
                  ))
                : controller.pengeluaranList.isEmpty
                    ? const Text("No data yet.")
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: controller.pengeluaranList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CustomerCardList(
                                        data:
                                            controller.pengeluaranList[index]);
                                  },
                                ),
                                SizedBox(
                                  height: 12.h,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
          ),
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: FloatingActionButton(
              onPressed: () {
                controller.showModal(context);
              },
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }
}
