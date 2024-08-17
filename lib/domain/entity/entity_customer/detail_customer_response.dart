class DetailCustomerResponse {
  bool? success;
  CustomerDetail? customer;
  List<CustomerHistory>? customerHistory;

  DetailCustomerResponse({this.success, this.customer, this.customerHistory});

  DetailCustomerResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    customer = json['customer'] != null
        ? CustomerDetail.fromJson(json['customer'])
        : null;
    if (json['customer_history'] != null) {
      customerHistory = <CustomerHistory>[];
      json['customer_history'].forEach((v) {
        customerHistory!.add(CustomerHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (customerHistory != null) {
      data['customer_history'] =
          customerHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerDetail {
  int? id;
  int? companyId;
  String? nama;
  String? nohp;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? customerOrder;
  int? totalHarga;
  int? totalTerbayar;
  int? totalSisa;
  String? platNomor;

  CustomerDetail(
      {this.id,
      this.companyId,
      this.nama,
      this.nohp,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.customerOrder,
      this.totalHarga,
      this.totalTerbayar,
      this.totalSisa,
      this.platNomor});

  CustomerDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    nama = json['nama'];
    nohp = json['nohp'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customerOrder = json['customer_order'];
    totalHarga = json['total_harga'];
    totalTerbayar = json['total_terbayar'];
    totalSisa = json['total_sisa'];
    platNomor = json['plat_nomor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['nama'] = nama;
    data['nohp'] = nohp;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['customer_order'] = customerOrder;
    data['total_harga'] = totalHarga;
    data['total_terbayar'] = totalTerbayar;
    data['total_sisa'] = totalSisa;
    data['plat_nomor'] = platNomor;
    return data;
  }
}

class CustomerHistory {
  int? id;
  int? createdBy;
  int? companyId;
  int? customerId;
  int? customerKendaraanId;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? totalHarga;
  int? totalTerbayar;
  int? totalSisa;

  CustomerHistory(
      {this.id,
      this.createdBy,
      this.companyId,
      this.customerId,
      this.customerKendaraanId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.totalHarga,
      this.totalTerbayar,
      this.totalSisa});

  CustomerHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdBy = json['created_by'];
    companyId = json['company_id'];
    customerId = json['customer_id'];
    customerKendaraanId = json['customer_kendaraan_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalHarga = json['total_harga'];
    totalTerbayar = json['total_terbayar'];
    totalSisa = json['total_sisa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_by'] = createdBy;
    data['company_id'] = companyId;
    data['customer_id'] = customerId;
    data['customer_kendaraan_id'] = customerKendaraanId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['total_harga'] = totalHarga;
    data['total_terbayar'] = totalTerbayar;
    data['total_sisa'] = totalSisa;
    return data;
  }
}