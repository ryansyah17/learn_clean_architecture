import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/detail.controller.dart';
import 'widgets/history_card.dart';

class DetailScreen extends GetView<DetailController> {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        init: DetailController(),
        builder: (ctrl) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Detail'),
            ),
            body: ctrl.loadingDetailCustomer
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  )
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              infoTitle(context,
                                  "${ctrl.detailCustomer.nama} - ${ctrl.detailCustomer.nohp}"),
                              Container(
                                width: 20,
                                height: 20,
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color:
                                          ctrl.detailCustomer.status == 'aktif'
                                              ? Colors.green
                                              : Colors.red),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              infoBody(context, "Last update"),
                              infoBody(
                                  context,
                                  ctrl.formatDate(
                                      ctrl.detailCustomer.updatedAt!))
                            ],
                          ),
                          const SizedBox(height: 28.0),
                          infoTitle(context, "History Order"),
                          ctrl.historyCustomer.isEmpty
                              ? const Text("No data yet.")
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: ctrl.historyCustomer.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return HistoryCard(
                                        data: ctrl.historyCustomer[index]);
                                  }),
                          const SizedBox(height: 28.0),
                        ],
                      ),
                    ),
                  ),
          );
        });
  }

  Widget infoTitle(BuildContext context, String data) {
    return Text(
      data,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Widget infoBody(BuildContext context, String data) {
    return Text(
      data,
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}
