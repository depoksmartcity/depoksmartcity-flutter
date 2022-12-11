import 'dart:convert';
import 'package:depoksmartcity/model/perpustakaan/author.dart';
import 'package:depoksmartcity/model/perpustakaan/fetchAuthorById.dart';
import 'package:depoksmartcity/model/perpustakaan/publisher.dart';
import 'package:depoksmartcity/model/perpustakaan/fetchPublisherById.dart';
import 'package:depoksmartcity/model/perpustakaan/bookReview.dart';
import 'package:depoksmartcity/model/perpustakaan/fetchBookReview.dart';
import 'package:depoksmartcity/model/perpustakaan/bookHistory.dart';
import 'package:depoksmartcity/model/perpustakaan/fetchBookHistory.dart';
import 'dart:async';

List<BookDetails> bookJson(String str) => List<BookDetails>.from(json.decode(str).map((x) => BookDetails.fromJson(x)));

String bookToJson(List<BookDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookDetails {
    BookDetails({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model? model;
    int pk;
    Fields fields;

    factory BookDetails.fromJson(Map<String, dynamic> json) => BookDetails(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"], json["pk"]),
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
        required this.authorName,
        required this.publisherName,
        required this.edition,
        required this.releaseDate,
        required this.photoUrl,
        required this.stock,
        required this.isAvailable,
        required this.rate,
        required this.borrowedTimes,
        required this.reviewedTimes,
        required this.isBorrowable,
        required this.isReturnable,
        required this.isReviewable,
        required this.listReview
    });

    String title;
    String isbn;
    String synopsis;
    int pages;
    int authorId;
    String authorName;
    String publisherName;
    int publisherId;
    int edition;
    DateTime releaseDate;
    String photoUrl;
    int stock;
    bool isAvailable;
    double rate;
    int borrowedTimes;
    int reviewedTimes;
    List<BookReview> listReview;
    bool isReturnable;
    bool isBorrowable;
    bool isReviewable;

    factory Fields.fromJson(Map<String, dynamic> json, int pk) {
      String authorNameStr = "";
      Future<List<Author>> listAuthorFuture = fetchAuthorById(json["author"]);
      listAuthorFuture.then((value) => {
        authorNameStr = value.elementAt(0).fields.firstName + " " + value.elementAt(0).fields.lastName
        });

      // Author author = listAuthor.elementAt(0);
      // String authorName = author.fields.firstName + " " + author.fields.lastName;

      String publisherNameStr = "";
      Future<List<Publisher>> listPublisher = fetchPublisherById(json["publisher"]);
      listPublisher.then((value) => {publisherNameStr = value.elementAt(0).fields.name});
      // print("test " + publisherNameStr);

      List<BookReview> listReview = [];
      fetchBookReview(pk).then((value) => {listReview = value});

      List<BookHistory> listBookHistoryActive = [];
      fetchBookHistoryActive(pk).then((value) => {listBookHistoryActive = value});

      List<BookHistory> listBookHistoryDone = [];
      fetchBookHistoryDone(pk).then((value) => {listBookHistoryDone = value});

      bool isReturnable = false;
      bool isBorrowable = true;
      bool isReviewable = false;

      if (listBookHistoryActive.length != 0) {
        isReturnable = true;
        isBorrowable = false;
      }
      if (listBookHistoryDone != 0) {
        isReviewable = true;
      }
      return Fields(
          title: json["title"],
          isbn: json["isbn"],
          synopsis: json["synopsis"],
          pages: json["pages"],
          authorId: json["author"],
          publisherId: json["publisher"],
          authorName: authorNameStr,
          publisherName: publisherNameStr,
          edition: json["edition"],
          stock: json["stock"],
          releaseDate: DateTime.parse(json["publication_date"]),
          photoUrl: json["photo"],
          isAvailable: json["is_available"],
          rate: double.parse(json["rate"]),
          borrowedTimes: json["borrowed_times"],
          reviewedTimes: json["review_times"],
          isBorrowable: isBorrowable,
          isReturnable: isReturnable,
          isReviewable: isReviewable,
          listReview: listReview
      );
    }

    Map<String, dynamic> toJson() => {
        "title": title,
        "isbn": isbn,
        "synopsis": synopsis,
        "pages": pages,
        "author_id": authorId,
        "publisher_id": publisherId,
        "edition": edition,
        "stock": stock,
        "published_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "borrowed_times": borrowedTimes,
        "reviewed_times": reviewedTimes,
    };
}

enum Model { BOOKDETAILS_BOOKDETAILS }

final modelValues = EnumValues({
    "bookdetails.bookdetails": Model.BOOKDETAILS_BOOKDETAILS
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