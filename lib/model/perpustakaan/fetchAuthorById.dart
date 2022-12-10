import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:depoksmartcity/model/perpustakaan/author.dart';


Future<List<Author>> fetchAuthorById(int idAuthor) async {
  var url =
      Uri.parse('http://tugas2pbpkiram.herokuapp.com/mywatchlist/json/$idAuthor');
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
  List<Author> listAuthor = [];
  for (var datum in data) {
    if (datum != null) {
      listAuthor.add(Author.fromJson(datum));
    }
  }

  return listAuthor;
}