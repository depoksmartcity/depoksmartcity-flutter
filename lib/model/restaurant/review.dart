// To parse this JSON data, do
//
//     final review = reviewFromJson(jsonString);

import 'dart:convert';

List<Review> reviewFromJson(String str) => List<Review>.from(json.decode(str).map((x) => Review.fromJson(x)));

String reviewToJson(List<Review> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Review {
    Review({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Review.fromJson(Map<String, dynamic> json) => Review(
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
        required this.resto,
        required this.review,
    });

    int resto;
    String review;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        resto: json["resto"],
        review: json["review"],
    );

    Map<String, dynamic> toJson() => {
        "resto": resto,
        "review": review,
    };
}
