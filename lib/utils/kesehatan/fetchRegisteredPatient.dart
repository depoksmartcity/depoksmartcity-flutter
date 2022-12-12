import 'package:depoksmartcity/model/kesehatan/patient.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:depoksmartcity/model/kesehatan/appointment.dart';

Future<List<Patient>> fetchRegisteredPatient(int userId) async {
  var url =
    Uri.parse('https://web-production-1710.up.railway.app//kesehatan/show-patient-flutter/$userId/json');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Appointment
  List<Patient> listPatient = [];
  for (var datum in data) {
    if (datum != null) {
      listPatient.add(Patient.fromJson(datum));
    }
  }

  return listPatient;
}