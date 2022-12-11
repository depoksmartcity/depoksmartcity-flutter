import 'package:depoksmartcity/model/aspirasi/aspirasiModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pbp_django_auth/pbp_django_auth.dart';

class UseAspirasi {
  Future<List<Aspirasi>> fetchAspirasi(CookieRequest request) async {
    var data = await request
        .get('https://web-production-1710.up.railway.app/aspirasi/json-user/');

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
