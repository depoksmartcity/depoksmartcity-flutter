import 'dart:convert';

List<HealthFacility> bookJson(String str) => List<HealthFacility>.from(json.decode(str).map((x) => HealthFacility.fromJson(x)));

String bookToJson(List<HealthFacility> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HealthFacility {
    HealthFacility({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model? model;
    int pk;
    Fields fields;

    factory HealthFacility.fromJson(Map<String, dynamic> json) => HealthFacility(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse![model],
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.name,
        required this.address,
        required this.address_url,
        required this.kecamatan,
        required this.phone_number,
        required this.capacity_timeslot
    });

    String name;
    String address;
    String address_url;
    String kecamatan;
    String phone_number;
    int capacity_timeslot;
    

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        address: json["address"],
        address_url: json["address_url"],
        kecamatan: json["kecamatan"],
        phone_number: json["phone_number"],
        capacity_timeslot: json["capacity_timeslot"],
        
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "address_url": address_url,
        "kecamatan": kecamatan,
        "phone_number" : phone_number,
        "capacity_timeslot" : capacity_timeslot
    };
}

enum Model { HEALTHFACILITY_HEALTHFACILITY }

final modelValues = EnumValues({
    "kesehatan.healthfacility": Model.HEALTHFACILITY_HEALTHFACILITY
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}