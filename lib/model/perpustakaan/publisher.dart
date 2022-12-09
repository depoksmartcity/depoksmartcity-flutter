import 'dart:convert';

List<Publisher> bookJson(String str) => List<Publisher>.from(json.decode(str).map((x) => Publisher.fromJson(x)));

String bookToJson(List<Publisher> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Publisher {
    Publisher({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model? model;
    int pk;
    Fields fields;

    factory Publisher.fromJson(Map<String, dynamic> json) => Publisher(
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
        required this.city,
        required this.stateProvince,
        required this.country,
        required this.website
    });

    String name;
    String address;
    String city;
    String stateProvince;
    String country;
    String website;
    
    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        address: json["address"],
        city: json["city"],
        stateProvince: json["state_province"],
        country: json["country"],
        website: json["website"]
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "city": city,
        "state_province": stateProvince,
        "country": country,
        "website": website
    };
}

enum Model { PUBLISHER_PUBLISHER }

final modelValues = EnumValues({
    "publisher.publisher": Model.PUBLISHER_PUBLISHER
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