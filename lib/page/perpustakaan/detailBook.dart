import 'package:flutter/material.dart';
import 'package:depoksmartcity/model/perpustakaan/bookReview.dart';
import 'package:depoksmartcity/model/perpustakaan/fetchAuthorById.dart';
import 'package:depoksmartcity/model/perpustakaan/fetchPublisherById.dart';
import 'package:depoksmartcity/model/perpustakaan/fetchBookHistory.dart';
import 'package:depoksmartcity/model/perpustakaan/fetchBookReview.dart';
import 'package:depoksmartcity/main.dart';
import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:depoksmartcity/providers/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage(
      {super.key,
      required this.pk,
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
      required this.listReview});

  final int pk;
  final String title;
  final String isbn;
  final String synopsis;
  final int pages;
  final int authorId;
  final String authorName;
  final String publisherName;
  final int publisherId;
  final int edition;
  final DateTime releaseDate;
  final String photoUrl;
  final int stock;
  final bool isAvailable;
  final double rate;
  final int borrowedTimes;
  final int reviewedTimes;
  final List<BookReview> listReview;
  final bool isReturnable;
  final bool isBorrowable;
  final bool isReviewable;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    var pagesStr = pages.toString();
    var editionStr = edition.toString();
    var stockStr = stock.toString();
    // var borrowedTimesStr = borrowedTimes.toString();
    // var reviewedTimesStr = reviewedTimes.toString();
    var date = releaseDate.toString().substring(0, 10);
    var rateStr = rate.toString();
    var buttonBorrow;
    var buttonReturn;
    var buttonReview;
    bool isBorrowableTest = false;

    if (isBorrowable) {
      buttonBorrow = Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                            onPressed: (() {
                            
                            }),
                            child: Text(
                              'Borrow',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue)),
                          )));
    }
    if (isReturnable) {
      buttonReturn = Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                            onPressed: (() {
                           
                            }),
                            child: Text(
                              'Return',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue)),
                          )));
    }
    if (isReviewable) {
      buttonReview = Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                            onPressed: (() {
                              
                            }),
                            child: Text(
                              'Review',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue)),
                          )));
    }
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Detail Buku'),
        ),

        // Menambahkan drawer menu
        drawer: DrawerClass(),
        body: SingleChildScrollView(
          child: Column(
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
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Image.network(photoUrl, height: 150,)),
            ),
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
              Text('$rateStr/5'),
            ]),
            const SizedBox(height: 20.0),
            FutureBuilder(
            future: fetchAuthorById(authorId),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Row(children: [
                  Text(
                    'Written By: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(snapshot.data!.elementAt(0).fields.firstName + " " +  snapshot.data!.elementAt(0).fields.lastName),
                ]);
              }
            }
            ),
            const SizedBox(height: 20.0),
            FutureBuilder(
            future: fetchPublisherById(publisherId),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Row(children: [
                  Text(
                    'Published By: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(snapshot.data!.elementAt(0).fields.name),
                ]);
              }
            }
            ),
            const SizedBox(height: 20.0),
            Row(children: [
              Text(
                'Pages: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(pagesStr),
            ]),
            const SizedBox(height: 20.0),
            Row(children: [
              Text(
                'Edition: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(editionStr),
            ]),
            const SizedBox(height: 20.0),
            Row(children: [
              Text(
                'Stock: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(stockStr),
            ]),
            const SizedBox(height: 20.0),
            Text('Synopsis:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(synopsis),
            const SizedBox(height: 20.0),
            FutureBuilder(
              future: fetchBookReview(pk),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.data.length == 0) {
                  return Column(
                    children: const [
                      Text(
                        "No Review Yet",
                        style:
                            TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                child: Text(
                                  "${snapshot.data![index].fields.rate}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                  "${snapshot.data![index].fields.review}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                )
                              ],
                            ),
                          )));
                }
              }
              }
            ),
            Visibility(
              visible: true,
              child: FutureBuilder(
                future: fetchBookHistoryActive(pk),
                builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.data.isEmpty) {
                  return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                    onPressed: () async {
                      final response = await request.post(
                          "https://web-production-1710.up.railway.app/perpustakaan/book/return/$pk/",
                          {});
                    },
                      child: Text(
                        'Return',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                    )));
                } else {
                return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                    onPressed: () async {
                      final response = await request.post(
                          "https://web-production-1710.up.railway.app/perpustakaan/book/borrow/$pk/",
                          {});
                    },
                      child: Text(
                        'Borrow',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                    )));
                }
              }}
            ),
            ),
            Visibility(
              visible: true,
              child: FutureBuilder(
                future: fetchBookHistoryDone(pk),
                builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.data.isEmpty) {
                    return Container(width: 0.0, height: 0.0,);
                  } else {
                  return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                      onPressed: () async {
                        final response = await request.post(
                            "https://web-production-1710.up.railway.app/perpustakaan/book/review/$pk/",
                            {});
                      },
                        child: Text(
                          'Review',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue)),
                      )));
                  }
                }}
              ),
              ),
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
    )));
  }
}
