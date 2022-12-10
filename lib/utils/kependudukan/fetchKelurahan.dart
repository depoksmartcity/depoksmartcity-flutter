import 'package:depoksmartcity/model/kependudukan/kelurahan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Kelurahan>> fetchKelurahan() async {
  var url =
      Uri.parse('https://web-production-1710.up.railway.app/kependudukan/json');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<Kelurahan> listKelurahan = [];
  for (var d in data) {
    if (d != null) {
      listKelurahan.add(Kelurahan.fromJson(d));
    }
  }

  return listKelurahan;
}
