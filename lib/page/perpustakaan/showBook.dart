import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:depoksmartcity/model/perpustakaan/bookDetails.dart';
import 'package:flutter/material.dart';
import 'package:depoksmartcity/main.dart';
import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:depoksmartcity/page/perpustakaan/detailBook.dart';
import 'package:depoksmartcity/model/perpustakaan/fetchBookDetails.dart';

class BooksPage extends StatefulWidget {
  const BooksPage(
      {Key? key})
      : super(key: key);


  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  Future<List<BookDetails>> listBookDetails = fetchBookDetails();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Books List'),
        ),

        // Menambahkan drawer menu
        drawer: DrawerClass(
        ),
        body: FutureBuilder(
            future: fetchBookDetails(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "No Data Yet",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => BookDetailsPage(
                                pk: snapshot.data![index].pk,
                                title: snapshot.data![index].fields.title,
                                isbn: snapshot.data![index].fields.isbn,
                                synopsis: snapshot.data![index].fields.synopsis,
                                pages: snapshot.data![index].fields.pages,
                                authorId: snapshot.data![index].fields.authorId,
                                publisherId: snapshot.data![index].fields.publisherId,
                                edition: snapshot.data![index].fields.edition,
                                releaseDate: snapshot.data![index].fields.releaseDate,
                                photoUrl: snapshot.data![index].fields.photoUrl,
                                stock: snapshot.data![index].fields.stock,
                                isAvailable: snapshot.data![index].fields.isAvailable,
                                rate: snapshot.data![index].fields.rate,
                                borrowedTimes: snapshot.data![index].fields.borrowedTimes,
                                reviewedTimes: snapshot.data![index].fields.reviewedTimes,
                              ))
                            );
                          },
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
                                child: Image.network(snapshot.data![index].fields.photoUrl),
                                ),
                                Center(
                                  child: Text(
                                  "${snapshot.data![index].fields.title}",
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
            }));
  }
}