import 'dart:convert';

List<Book> bookJson(String str) => List<Book>.from(json.decode(str).map((x) => Book.fromJson(x)));

String bookToJson(List<Book> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Book {
    Book({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model? model;
    int pk;
    Fields fields;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
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
        required this.title,
        required this.isbn,
        required this.synopsis,
        required this.pages,
        required this.authorId,
        required this.publisherId,
        required this.edition,
        required this.stock,
        required this.releaseDate,
        required this.borrowedTimes,
        required this.reviewedTimes,
    });

    String title;
    String isbn;
    String synopsis;
    int pages;
    int authorId;
    int publisherId;
    int edition;
    int stock;
    DateTime releaseDate;
    int borrowedTimes;
    int reviewedTimes;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        title: json["title"],
        isbn: json["isbn"],
        synopsis: json["synopsis"],
        pages: json["pages"],
        authorId: json["author_id"],
        publisherId: json["publisher_id"],
        edition: json["edition"],
        stock: json["stock"],
        releaseDate: DateTime.parse(json["publication_date"]),
        borrowedTimes: json["borrowed_times"],
        reviewedTimes: json["reviewed_times"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "isbn": isbn,
        "synopsis": synopsis,
        "pages": pages,
        "author_id": authorId,
        "publisher_id": publisherId,
        "edition": edition,
        "stock": stock,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "borrowed_times": borrowedTimes,
        "reviewed_times": reviewedTimes,
    };
}

enum Model { BOOK_BOOK }

final modelValues = EnumValues({
    "book.book": Model.BOOK_BOOK
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