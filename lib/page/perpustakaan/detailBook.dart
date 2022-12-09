import 'package:flutter/material.dart';
import 'package:depoksmartcity/model/perpustakaan/bookReview.dart';
import 'package:depoksmartcity/main.dart';
import 'package:depoksmartcity/drawer/drawer.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage(
      {super.key,
        required this.title,
        required this.isbn,
        required this.synopsis,
        required this.pages,
        required this.authorId,
        required this.publisherId,
        required this.authorName,
        required this.publisherName,
        required this.edition,
        required this.stock,
        required this.releaseDate,
        required this.borrowedTimes,
        required this.reviewedTimes,
        required this.isBorrowable,
        required this.isReturnable,
        required this.isReviewable,
        required this.listReview});


    String title;
    String isbn;
    String synopsis;
    int pages;
    int authorId;
    String authorName;
    String publisherName;
    int publisherId;
    int edition;
    int stock;
    DateTime releaseDate;
    int borrowedTimes;
    int reviewedTimes;
    List<BookReview> listReview;
    bool isReturnable;
    bool isBorrowable;
    bool isReviewable;

  @override
  Widget build(BuildContext context) {
    var date = releaseDate.toString().substring(0, 10);
    var ratingStr = rate.toString();
    var watchedStr;
    if (watched == 1) {
      watchedStr = 'watched';
    } 
    else {
      watchedStr = 'not watched';
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Buku'),
        ),

        // Menambahkan drawer menu
        drawer: DrawerClass(
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Container(
                child: Align(
              alignment: Alignment.center,
              child: Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34)),
            )),
            const SizedBox(height: 20.0),
            Row(children: [
              Text(
                'Release Date: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(date),
            ]),
            const SizedBox(height: 20.0),
            Row(children: [
              Text(
                'Rating: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('$rating/5'),
            ]),
            const SizedBox(height: 20.0),
            Row(children: [
              Text(
                'Watched: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(watchedStr),
            ]),
            const SizedBox(height: 20.0),
            Text('Review:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(review),
            Spacer(),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                    ))),
          ],
        ));
  }
}