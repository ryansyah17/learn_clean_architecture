class CustomerResponse {
  bool? success;
  List<Customers>? customers;

  CustomerResponse({this.success, this.customers});

  CustomerResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['customers'] != null) {
      customers = <Customers>[];
      json['customers'].forEach((v) {
        customers!.add(Customers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (customers != null) {
      data['customers'] = customers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customers {
  int? id;
  int? companyId;
  String? nama;
  String? nohp;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? platNomor;

  Customers(
      {this.id,
      this.companyId,
      this.nama,
      this.nohp,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.platNomor});

  factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        id: json['id'],
        companyId: json['company_id'],
        nama: json['nama'],
        nohp: json['nohp'],
        status: json['status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        platNomor: json['plat_nomor'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "nama": nama,
        "nohp": nohp,
        "status": status,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "platNomor": platNomor,
      };
}
