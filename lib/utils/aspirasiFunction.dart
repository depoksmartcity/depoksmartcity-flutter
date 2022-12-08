import 'package:depoksmartcity/models/aspirasiModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UseAspirasi {
  Future<List<Aspirasi>> fetchAspirasi() async {
    var url = Uri.parse('https://web-production-1710.up.railway.app/aspirasi/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Aspirasi
    List<Aspirasi> listAspirasi = [];
    for (var d in data) {
      if (d != null) {
        listAspirasi.add(Aspirasi.fromJson(d));
      }
    }

    return listAspirasi;
  }

}
