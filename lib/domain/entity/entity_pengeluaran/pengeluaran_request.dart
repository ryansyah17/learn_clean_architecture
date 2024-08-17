class PengeluaranRequest {
  int? companyId;

  PengeluaranRequest({
    this.companyId,
  });

  PengeluaranRequest.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_id'] = companyId;
    return data;
  }
}
