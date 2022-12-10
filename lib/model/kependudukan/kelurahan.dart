// To parse this JSON data, do
//
//     final kelurahan = kelurahanFromJson(jsonString);

import 'dart:convert';

List<Kelurahan> kelurahanFromJson(String str) =>
    List<Kelurahan>.from(json.decode(str).map((x) => Kelurahan.fromJson(x)));

String kelurahanToJson(List<Kelurahan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kelurahan {
  Kelurahan({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Kelurahan.fromJson(Map<String, dynamic> json) => Kelurahan(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.name,
    required this.kecamatan,
    required this.address,
  });

  String name;
  String kecamatan;
  String address;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        kecamatan: json["kecamatan"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "kecamatan": kecamatan,
        "address": address,
      };
}
