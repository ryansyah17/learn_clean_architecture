class DetailArguments {
  int id;
  String? status;
  String? tipe;

  DetailArguments({
    required this.id,
    this.status,
    this.tipe,
  });

  factory DetailArguments.fromJson(Map<String, dynamic> json) =>
      DetailArguments(
        id: json["id"],
        status: json["status"],
        tipe: json["tipe"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "tipe": tipe,
      };
}
