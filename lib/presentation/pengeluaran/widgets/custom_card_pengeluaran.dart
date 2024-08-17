import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_clean_architecture/domain/entity/entity_pengeluaran/pengeluaran_response.dart';
import 'package:learn_clean_architecture/presentation/pengeluaran/controllers/pengeluaran.controller.dart';

class CustomerCardList extends StatelessWidget {
  CustomerCardList({super.key, required this.data});

  final Pengeluaran data;

  final homeCtrl = Get.find<PengeluaranController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {},
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
                      data.id.toString(),
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
                Text(homeCtrl.formatDate(data.createdAt.toString())),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12.0)
      ],
    );
  }
}
