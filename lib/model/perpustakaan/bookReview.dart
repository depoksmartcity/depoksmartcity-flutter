import 'dart:convert';

List<BookReview> bookJson(String str) => List<BookReview>.from(json.decode(str).map((x) => BookReview.fromJson(x)));

String bookToJson(List<BookReview> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookReview {
    BookReview({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model? model;
    int pk;
    Fields fields;

    factory BookReview.fromJson(Map<String, dynamic> json) => BookReview(
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
        required this.rate,
        required this.review
    });

    int userId;
    int bookId;
    int rate;
    String review;
    

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        userId: json["user"],
        bookId: json["book"],
        rate: json["rate"],
        review: json["review"]
    );

    Map<String, dynamic> toJson() => {
        "user": userId,
        "book": bookId,
        "rate": rate,
        "review": review,
    };
}

enum Model { BOOKREVIEW_BOOKREVIEW }

final modelValues = EnumValues({
    "bookreview.bookreview": Model.BOOKREVIEW_BOOKREVIEW
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