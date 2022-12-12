import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:depoksmartcity/model/kesehatan/healthFacility.dart';

Future<List<HealthFacility>> fetchHealthFacilities() async {
  var url =
    Uri.parse('https://web-production-1710.up.railway.app/kesehatan/health-facility/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object HealthFacility
  List<HealthFacility> listHealthFacility = [];
  for (var datum in data) {
    if (datum != null) {
      listHealthFacility.add(HealthFacility.fromJson(datum));
    }
  }
  return listHealthFacility;
}