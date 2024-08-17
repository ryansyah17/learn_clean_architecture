class CustomerRequest {
  int? companyId;

  CustomerRequest({
    this.companyId,
  });

  factory CustomerRequest.fromJson(Map<String, dynamic> json) =>
      CustomerRequest(
        companyId: json["company_id"],
      );

  Map<String, dynamic> toJson() => {
        "company_id": companyId,
      };
}
