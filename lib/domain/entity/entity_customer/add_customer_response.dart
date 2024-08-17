class AddCustomerResponse {
  bool? success;
  String? message;

  AddCustomerResponse({
    this.success,
    this.message,
  });

  factory AddCustomerResponse.fromJson(Map<String, dynamic> json) => AddCustomerResponse(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
