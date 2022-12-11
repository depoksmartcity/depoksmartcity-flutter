import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:depoksmartcity/model/perpustakaan/bookReview.dart';


Future<List<BookReview>> fetchBookReview(int bookPk) async {
  var url =
      Uri.parse('https://web-production-1710.up.railway.app/perpustakaan/book/review/$bookPk/json');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object MyWatchlist
  List<BookReview> listBookReview = [];
  for (var datum in data) {
    if (datum != null) {
      listBookReview.add(BookReview.fromJson(datum));
    }
  }

  return listBookReview;
}