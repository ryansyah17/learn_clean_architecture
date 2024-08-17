class DetailCustomerRequest {
  int? companyId;
  int? customerId;

  DetailCustomerRequest({
    this.companyId,
    this.customerId,
  });

  factory DetailCustomerRequest.fromJson(Map<String, dynamic> json) => DetailCustomerRequest(
        companyId: json["company_id"],
        customerId: json["customer_id"],
      );

  Map<String, dynamic> toJson() => {
        "company_id": companyId,
        "customer_id": customerId,
      };
}
