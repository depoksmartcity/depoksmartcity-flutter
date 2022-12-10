import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:depoksmartcity/model/perpustakaan/publisher.dart';


Future<List<Publisher>> fetchPublisher() async {
  var url =
      Uri.parse('http://tugas2pbpkiram.herokuapp.com/mywatchlist/json/');
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
  List<Publisher> listPublisher = [];
  for (var datum in data) {
    if (datum != null) {
      listPublisher.add(Publisher.fromJson(datum));
    }
  }

  return listPublisher;
}