// To parse this JSON data, do
//
//     final aspirasi = aspirasiFromJson(jsonString);

import 'dart:convert';

List<Aspirasi> aspirasiFromJson(String str) => List<Aspirasi>.from(json.decode(str).map((x) => Aspirasi.fromJson(x)));

String aspirasiToJson(List<Aspirasi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Aspirasi {
    Aspirasi({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model model;
    int pk;
    Fields fields;

    factory Aspirasi.fromJson(Map<String, dynamic> json) => Aspirasi(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.user,
        required this.date,
        required this.aspirasi,
    });

    int user;
    DateTime date;
    String aspirasi;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        date: DateTime.parse(json["date"]),
        aspirasi: json["aspirasi"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "date": date.toIso8601String(),
        "aspirasi": aspirasi,
    };
}

enum Model { ASPIRASI_ASPIRASI }

final modelValues = EnumValues({
    "aspirasi.aspirasi": Model.ASPIRASI_ASPIRASI
});

class EnumValues<T> {
    late Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}


