import 'dart:convert';

List<BookHistory> bookJson(String str) => List<BookHistory>.from(json.decode(str).map((x) => BookHistory.fromJson(x)));

String bookToJson(List<BookHistory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookHistory {
    BookHistory({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model? model;
    int pk;
    Fields fields;

    factory BookHistory.fromJson(Map<String, dynamic> json) => BookHistory(
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
        required this.userId,
        required this.bookId,
        required this.borrowDate,
        required this.returnDate,
        required this.isActive
    });

    int userId;
    int bookId;
    DateTime borrowDate;
    DateTime returnDate;
    bool isActive;
    

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        userId: json["user"],
        bookId: json["book"],
        borrowDate: json["borrow_date"],
        returnDate: json["return_date"],
        isActive: json["is_active"]
    );

    Map<String, dynamic> toJson() => {
        "user": userId,
        "book": bookId,
        "borrow_date": "${borrowDate.year.toString().padLeft(4, '0')}-${borrowDate.month.toString().padLeft(2, '0')}-${borrowDate.day.toString().padLeft(2, '0')}",
        "return_date": "${returnDate.year.toString().padLeft(4, '0')}-${returnDate.month.toString().padLeft(2, '0')}-${returnDate.day.toString().padLeft(2, '0')}",
        "is_active": isActive,
    };
}

enum Model { BOOKHISTORY_BOOKHISTORY }

final modelValues = EnumValues({
    "bookhistory.bookhistory": Model.BOOKHISTORY_BOOKHISTORY
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