class AddCustomerRequest {
  int? companyId;
  String? nama;
  String? nohp;

  AddCustomerRequest({this.companyId, this.nama, this.nohp});

  AddCustomerRequest.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    nama = json['nama'];
    nohp = json['nohp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_id'] = companyId;
    data['nama'] = nama;
    data['nohp'] = nohp;
    return data;
  }
}