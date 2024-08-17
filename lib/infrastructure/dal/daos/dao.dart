import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:learn_clean_architecture/domain/entity/entity_auth/login_request.dart';
import 'package:learn_clean_architecture/domain/entity/entity_pengeluaran/pengeluaran_request.dart';
import 'package:learn_clean_architecture/infrastructure/dal/services/api.dart';
import 'package:learn_clean_architecture/infrastructure/dal/storage/storage.dart'
    as storage;
import '../../../domain/constant.dart';
import '../../../domain/entity/entity_auth/login_response.dart';
import '../../../domain/entity/entity_customer/add_customer_request.dart';
import '../../../domain/entity/entity_customer/add_customer_response.dart';
import '../../../domain/entity/entity_customer/customer_request.dart';
import '../../../domain/entity/entity_customer/customer_response.dart';
import '../../../domain/entity/entity_customer/detail_customer_request.dart';
import '../../../domain/entity/entity_customer/detail_customer_response.dart';
import '../../../domain/entity/entity_pengeluaran/pengeluaran_response.dart';
import '../../navigation/routes.dart';

class Dao {
  Future<LoginResponse> login(LoginRequest params) async {
    try {
      var api = ApiRequest('api/auth/login', params.toJson());
      var res = await api.post();
      return LoginResponse.fromJson(res);
    } catch (e) {
      return LoginResponse(
        success: false,
        message: 'Login Gagal',
      );
    }
  }

  static Future<void> logout() async {
    if (kDebugMode) {
      String? token = storage.Storage.getValue(Constant.authToken);
      print("Remove Login token $token");
    }

    storage.Storage.removeValue(Constant.authToken);

    Get.offAllNamed(Routes.LOGIN);
  }

  Future<AddCustomerResponse> addCustomer(AddCustomerRequest params) async {
    try {
      var api = ApiRequest("/api/m/customers/store", params.toJson());
      var res = await api.post();
      return AddCustomerResponse.fromJson(res);
    } catch (e) {
      return AddCustomerResponse(success: false, message: "gagal");
    }
  }

  Future<CustomerResponse> listCustomer(CustomerRequest params) async {
    try {
      var api = ApiRequest("/api/m/customers", params.toJson());
      var res = await api.get();
      return CustomerResponse.fromJson(res);
    } catch (e) {
      return CustomerResponse(success: false, customers: []);
    }
  }

  Future<DetailCustomerResponse> detailCustomer(
      DetailCustomerRequest params) async {
    try {
      var api = ApiRequest("/api/m/customers", params.toJson());
      var res = await api.get();
      return DetailCustomerResponse.fromJson(res);
    } catch (e) {
      return DetailCustomerResponse(success: false);
    }
  }

  Future<PengeluaranResponse> listPengeluaran(PengeluaranRequest params) async {
    try {
      var api = ApiRequest("api/m/pengeluaran", params.toJson());
      var res = await api.get();
      return PengeluaranResponse.fromJson(res);
    } catch (e) {
      return PengeluaranResponse(success: false, pengeluaran: []);
    }
  }
}
