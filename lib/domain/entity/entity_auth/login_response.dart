class LoginResponse {
  bool? success;
  String? message;
  String? token;

  LoginResponse({
    this.success,
    this.message,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "token": token,
      };
}
