class PengeluaranResponse {
  bool? success;
  List<Pengeluaran>? pengeluaran;

  PengeluaranResponse({
    this.success,
    this.pengeluaran,
  });

  factory PengeluaranResponse.fromJson(Map<String, dynamic> json) =>
      PengeluaranResponse(
        success: json["success"],
        pengeluaran: json["pengeluaran"] == null
            ? []
            : List<Pengeluaran>.from(
                json["pengeluaran"]!.map((x) => Pengeluaran.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "pengeluaran": pengeluaran == null
            ? []
            : List<dynamic>.from(pengeluaran!.map((x) => x.toJson())),
      };
}

class Pengeluaran {
  int? id;
  int? companyId;
  int? createdBy;
  DateTime? tanggal;
  int? total;
  String? deskripsi;
  String? foto;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fotoUrl;
  String? createdByName;

  Pengeluaran({
    this.id,
    this.companyId,
    this.createdBy,
    this.tanggal,
    this.total,
    this.deskripsi,
    this.foto,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.fotoUrl,
    this.createdByName,
  });

  factory Pengeluaran.fromJson(Map<String, dynamic> json) => Pengeluaran(
        id: json["id"],
        companyId: json["company_id"],
        createdBy: json["created_by"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        total: json["total"],
        deskripsi: json["deskripsi"],
        foto: json["foto"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        fotoUrl: json["foto_url"],
        createdByName: json["created_by_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "created_by": createdBy,
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "total": total,
        "deskripsi": deskripsi,
        "foto": foto,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "foto_url": fotoUrl,
        "created_by_name": createdByName,
      };
}
