// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Restaurants> welcomeFromJson(String str) => List<Restaurants>.from(json.decode(str).map((x) => Restaurants.fromJson(x)));

String welcomeToJson(List<Restaurants> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Restaurants {
    Restaurants({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
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
        required this.lokasi,
        required this.desc,
        required this.img,
    });

    String name;
    String lokasi;
    String desc;
    String img;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        lokasi: json["lokasi"],
        desc: json["desc"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "lokasi": lokasi,
        "desc": desc,
        "img": img,
    };
}

// enum Model { MYWATCHLIST_MYWATCHLIST }

// final modelValues = EnumValues({
//     "restaurant.restaurants": Model.MYWATCHLIST_MYWATCHLIST
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap;
//         return reverseMap;
//     }
// }
