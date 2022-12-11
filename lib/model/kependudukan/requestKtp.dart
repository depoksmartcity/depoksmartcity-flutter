// To parse this JSON data, do
//
//     final requestKtp = requestKtpFromJson(jsonString);

import 'dart:convert';

List<RequestKtp> requestKtpFromJson(String str) =>
    List<RequestKtp>.from(json.decode(str).map((x) => RequestKtp.fromJson(x)));

String requestKtpToJson(List<RequestKtp> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestKtp {
  RequestKtp({
    required this.pk,
    required this.fields,
  });

  @override
  String toString() {
    // TODO: implement toString
    return this.fields.scheduleDate.year.toString() +
        "-" +
        this.fields.scheduleDate.month.toString() +
        "-" +
        this.fields.scheduleDate.day.toString();
  }

  int pk;
  Fields fields;

  factory RequestKtp.fromJson(Map<String, dynamic> json) => RequestKtp(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.requestedAt,
    required this.provinsi,
    required this.kota,
    required this.kecamatan,
    required this.kelurahan,
    required this.permohonan,
    required this.namaLengkap,
    required this.nomorKk,
    required this.nik,
    required this.alamat,
    required this.rt,
    required this.rw,
    required this.kodePos,
    required this.nomorHp,
    required this.scheduleDate,
    required this.scheduleTime,
  });

  String requestedAt;
  String provinsi;
  String kota;
  String kecamatan;
  String kelurahan;
  String permohonan;
  String namaLengkap;
  String nomorKk;
  String nik;
  String alamat;
  String rt;
  String rw;
  String kodePos;
  String nomorHp;
  DateTime scheduleDate;
  String scheduleTime;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        requestedAt: json["requested_at"],
        provinsi: json["provinsi"],
        kota: json["kota"],
        kecamatan: json["kecamatan"],
        kelurahan: json["kelurahan"],
        permohonan: json["permohonan"],
        namaLengkap: json["nama_lengkap"],
        nomorKk: json["nomor_kk"],
        nik: json["nik"],
        alamat: json["alamat"],
        rt: json["rt"],
        rw: json["rw"],
        kodePos: json["kode_pos"],
        nomorHp: json["nomor_hp"],
        scheduleDate: DateTime.parse(json["schedule_date"]),
        scheduleTime: json["schedule_time"],
      );

  Map<String, dynamic> toJson() => {
        "requested_at": requestedAt,
        "provinsi": provinsi,
        "kota": kota,
        "kecamatan": kecamatan,
        "kelurahan": kelurahan,
        "permohonan": permohonan,
        "nama_lengkap": namaLengkap,
        "nomor_kk": nomorKk,
        "nik": nik,
        "alamat": alamat,
        "rt": rt,
        "rw": rw,
        "kode_pos": kodePos,
        "nomor_hp": nomorHp,
        "schedule_date":
            "${scheduleDate.year.toString().padLeft(4, '0')}-${scheduleDate.month.toString().padLeft(2, '0')}-${scheduleDate.day.toString().padLeft(2, '0')}",
        "schedule_time": scheduleTime,
      };
}
