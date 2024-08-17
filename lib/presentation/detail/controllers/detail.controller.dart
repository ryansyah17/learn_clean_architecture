import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../domain/entity/entity_customer/detail_arguments.dart';
import '../../../domain/entity/entity_customer/detail_customer_request.dart';
import '../../../domain/entity/entity_customer/detail_customer_response.dart';
import '../../../infrastructure/dal/daos/dao.dart';

class DetailController extends GetxController {
  CustomerDetail detailCustomer = CustomerDetail();
  List<CustomerHistory> historyCustomer = [];

  DetailArguments args = Get.arguments;

  bool loadingDetailCustomer = false;

  @override
  void onInit() {
    getDetailCustomer(true);
    super.onInit();
  }

  Future<void> getDetailCustomer(bool isRefresh) async {
    loadingDetailCustomer = true;
    update();

    DetailCustomerRequest params = DetailCustomerRequest(
      companyId: 1,
      customerId: args.id,
    );

    try {
      var res = await Dao().detailCustomer(params);
      if (res.success == true) {
        detailCustomer = res.customer!;
        historyCustomer
            .addAll(res.customerHistory as Iterable<CustomerHistory>);

        loadingDetailCustomer = false;
        update();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Failed get detail data");
      }

      loadingDetailCustomer = false;
      update();
    }
  }

  String formatDate(String dateStr) {
    DateTime parsedDate = DateTime.parse(dateStr);
    String formattedDate = DateFormat('dd MMMM yyyy, HH:mm').format(parsedDate);

    return formattedDate;
  }
}
