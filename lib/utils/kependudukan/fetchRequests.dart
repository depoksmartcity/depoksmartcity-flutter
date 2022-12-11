import 'package:depoksmartcity/model/kependudukan/requestKtp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<RequestKtp>> fetchRequests(username) async {
  var url = Uri.parse(
      'https://web-production-1710.up.railway.app/kependudukan/request-ktp/json-flutter');
  final response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'username': username,
      }));

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<RequestKtp> listRequests = [];
  for (var d in data) {
    if (d != null) {
      listRequests.add(RequestKtp.fromJson(d));
    }
  }

  return listRequests;
}
