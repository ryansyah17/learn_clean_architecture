import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entity/entity_customer/customer_response.dart';
import '../../../domain/entity/entity_customer/detail_arguments.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../controllers/home.controller.dart';

class CustomerCard extends StatelessWidget {
  CustomerCard({super.key, required this.data});

  final Customers data;

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            var args = DetailArguments(id: data.id!);
            Get.toNamed(Routes.DETAIL, arguments: args);
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.nama!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: data.status! == 'aktif'
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(12.0)),
                    )
                  ],
                ),
                const SizedBox(height: 8.0),
                Text(data.nohp!),
                const SizedBox(height: 8.0),
                data.platNomor != null && data.platNomor!.isNotEmpty
                    ? listPlatMotor(data.platNomor!)
                    : const Text("No data yet."),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12.0)
      ],
    );
  }

  Widget listPlatMotor(String platNomor) {
    List<String> platNomorList =
        platNomor.split(',').map((item) => item.trim()).toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: platNomorList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: Colors.white,
          child: Center(
            child: Text(
              platNomorList[index],
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        );
      },
    );
  }
}
