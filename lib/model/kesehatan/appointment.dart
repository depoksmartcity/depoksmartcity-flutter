import 'dart:convert';

List<Appointment> bookJson(String str) => List<Appointment>.from(json.decode(str).map((x) => Appointment.fromJson(x)));

String bookToJson(List<Appointment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Appointment {
    Appointment({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model? model;
    int pk;
    Fields fields;

    factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
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
        required this.appointed_by,
        required this.appointed_by_name,
        required this.facility,
        required this.facility_name,
        required this.date,
        required this.timeslot
    });

    int appointed_by;
    String appointed_by_name;
    int facility;
    String facility_name;
    DateTime date;
    String timeslot;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        appointed_by: json["appointed_by"],
        appointed_by_name: json["appointed_by_name"],
        facility: json["facility"],
        facility_name: json["facility_name"],
        date: DateTime.parse(json["date"]),
        timeslot: json["timeslot"]
    );

    Map<String, dynamic> toJson() => {
        "appointed_by": appointed_by,
        "appointed_by_name": appointed_by_name,
        "facility": facility,
        "facility_name": facility_name,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "timeslot": timeslot,
    };
}

enum Model { APPOINTMENT_APPOINTMENT }

final modelValues = EnumValues({
    "kesehatan.appointment": Model.APPOINTMENT_APPOINTMENT
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