import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:depoksmartcity/model/perpustakaan/bookHistory.dart';


Future<List<BookHistory>> fetchBookHistoryActive(int pkBook) async {
  List<BookHistory> listBookHistory = [];
  var url =
      Uri.parse('https://web-production-1710.up.railway.app/perpustakaan/book/history/active/$pkBook');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );
  var data;
  try {
    var data = jsonDecode(utf8.decode(response.bodyBytes));
  }
  catch (error){
    return listBookHistory;
  }

  // melakukan konversi data json menjadi object MyWatchlist
  for (var datum in data) {
    if (datum != null) {
      listBookHistory.add(BookHistory.fromJson(datum));
    }
  }

  return listBookHistory;
}

Future<List<BookHistory>> fetchBookHistoryDone(int pkBook) async {
  List<BookHistory> listBookHistory = [];
  var url =
      Uri.parse('https://web-production-1710.up.railway.app/perpustakaan/book/history/done/$pkBook');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data;
  try {
    var data = jsonDecode(utf8.decode(response.bodyBytes));
  }
  catch (error){
    return listBookHistory;
  }

  // melakukan konversi data json menjadi object MyWatchlist
  for (var datum in data) {
    if (datum != null) {
      listBookHistory.add(BookHistory.fromJson(datum));
    }
  }

  return listBookHistory;
}