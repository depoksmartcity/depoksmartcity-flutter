import 'dart:convert';

List<Patient> bookJson(String str) => List<Patient>.from(json.decode(str).map((x) => Patient.fromJson(x)));

String bookToJson(List<Patient> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Patient{
    Patient({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model? model;
    int pk;
    Fields fields;

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
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
        required this.user,
        required this.first_name,
        required this.last_name,
        required this.mother_name,
        required this.email,
        required this.gender,
        required this.age,
        required this.address
    });

    int user;
    String first_name;
    String last_name;
    String mother_name;
    String email;
    String gender;
    int age;
    String address;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        mother_name: json["mother_name"],
        email: json["email"],
        gender: json["gender"],
        age: json["age"],
        address: json["address"]
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "first_name": first_name,
        "last_name": last_name,
        "mother_name": mother_name,
        "email": email,
        "gender": gender,
        "age": age,
        "address": address,
    };
}

enum Model { PATIENT_PATIENT }

final modelValues = EnumValues({
    "kesehatan.patient": Model.PATIENT_PATIENT
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