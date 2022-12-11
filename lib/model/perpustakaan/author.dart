import 'dart:convert';

List<Author> bookJson(String str) => List<Author>.from(json.decode(str).map((x) => Author.fromJson(x)));

String bookToJson(List<Author> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Author {
    Author({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model? model;
    int pk;
    Fields fields;

    factory Author.fromJson(Map<String, dynamic> json) => Author(
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
        required this.firstName,
        required this.middleName,
        required this.lastName,
        required this.email
    });

    String firstName;
    String middleName;
    String lastName;
    String email;
    

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        email: json["email"]
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "email": email,
    };
}

enum Model { AUTHOR_AUTHOR }

final modelValues = EnumValues({
    "author.author": Model.AUTHOR_AUTHOR
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