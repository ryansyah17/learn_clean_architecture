import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entity/entity_customer/detail_customer_response.dart';
import '../controllers/detail.controller.dart';

class HistoryCard extends StatelessWidget {
  HistoryCard({super.key, required this.data});

  final CustomerHistory data;

  final dtlController = Get.find<DetailController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                    dtlController.formatDate(data.updatedAt!),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    data.status!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12.0)
      ],
    );
  }
}
