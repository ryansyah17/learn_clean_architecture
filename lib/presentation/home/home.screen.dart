import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'controllers/home.controller.dart';
import 'widgets/customer_card.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            ElevatedButton(
              onPressed: () {
                ctrl.logout();
              },
              child: const Icon(Icons.logout),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => Future.sync(() => ctrl.getListCustomer(true)),
          child: ctrl.loadingListCustomer
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.blue,
                ))
              : ctrl.customerList.isEmpty
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
                                itemCount: ctrl.customerList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CustomerCard(
                                      data: ctrl.customerList[index]);
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
              ctrl.showModal(context);
            },
            child: const Icon(Icons.add),
          ),
        ),
      );
    });
  }
}
