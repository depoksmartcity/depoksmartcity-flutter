import 'dart:convert';

import 'package:depoksmartcity/model/kesehatan/healthFacility.dart';
import 'package:depoksmartcity/page/kesehatan/healthFacilites.dart';
import 'package:depoksmartcity/page/kesehatan/patientRegistration.dart';
import 'package:depoksmartcity/utils/kesehatan/fetchHealthFacilities.dart';
import 'package:depoksmartcity/model/kesehatan/patient.dart';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:depoksmartcity/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class AddAppointment extends StatefulWidget {
  const AddAppointment({super.key, required this.userPk});

  final int userPk;
  @override
  State<AddAppointment> createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  final _formKey = GlobalKey<FormState>();

  String facility_pk_str = "";
  
  String facility_name = '-----------------------';
  List<String> listFaskes = [
    '-----------------------',
    'Rumah Sakit Mitra Keluarga Depok',
    'RSU Hermina Depok',
    'Rumah Sakit Universitas Indonesia (RSUI)',
    'Rumah Sakit Grha Permata Ibu',
    'RSU Bunda Margonda'
  ];

  DateTime? scheduled_date;
  String scheduled_timeslot = '---------';
  List<String> listTimeslot = [
    '---------',
    '08:00 - 08:30',
    '09:00 - 09:30',
    '09.30 - 10:00',
    '10.00 - 10.30',
    '10.30 - 11:00',
    '11.00 - 11:30',
    '11.30 - 12:00',
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.read<CookieRequest>();
    String userPkStr = widget.userPk.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwalkan Konsultasi'),
        backgroundColor: Color(0xFF003320),
      ),

      // Menambahkan drawer
      drawer: DrawerClass(),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                // Pilih Fasilitas Kesehatan
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  
                  child: ListTile(
                    title: const Text(
                      'Fasilitas Kesehatan',
                    ),
                    trailing: DropdownButton(
                      value: facility_name,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: listFaskes.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );   
                      }).toList(),

                      onChanged: (String? newValue) {
                        setState(() {
                          facility_name = newValue!;
                        });
                      },
                    ),   
                  ),
                ),


                // Pilih Tanggal
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: const Text(
                      'Pilih Tanggal',
                    ),

                    trailing: TextButton(
                      child: Text(scheduled_date == null
                          ? "Pilih"
                          : "${scheduled_date!.day}/${scheduled_date!.month}/${scheduled_date!.year}"),
                    
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2023),
                      ).then((date) {
                        setState(() {
                          scheduled_date = date;
                        });
                      });
                    },
                  ),
                ),
                ),


                // Pilih Waktu Konsultasi
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: const Text(
                    'Pilih Waktu',
                    ),
                    trailing: DropdownButton(
                      value: scheduled_timeslot,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: listTimeslot.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          scheduled_timeslot = newValue!;
                        });
                      },
                    ),
                  ),
                ),


                // Tombol tambahkan konsultasi
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFF003320),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextButton(
                        child: Text(
                        "Tambah Konsultasi",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size.fromHeight(40)),
                      ),

                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final response = await http.post(
                            Uri.parse("https://web-production-1710.up.railway.app/kesehatan/create-appointment-flutter/"),
                            headers: <String, String>{
                            'Content-Type': 'application/json;charset=UTF-8'
                          },
                          
                          body: jsonEncode(<String, String>{
                          'user' : userPkStr,
                          'facility' : facility_name,
                          'date' : ("${scheduled_date?.year}" + "-" + "${scheduled_date?.month}" + "-" + "${scheduled_date?.day}"),
                          'timeslot': scheduled_timeslot,
                      }));
                        
                        var jsonData = jsonDecode(response.body);
                        String status = jsonData['status'];

                        if (status == "Success"){
                        ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                            content: Row(
                            children: const [
                              Icon(Icons.info_outline_rounded,
                                size: 30, color: Colors.white),
                              Spacer(
                                flex: 1,
                              ),
                              Text("Penjadwalan Konsultasi Berhasil",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20))
                          ],
                          )
                          )
                        );
                        
                        Navigator.pop(context);

                      } else {
                        ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                            content: Row(
                            children: const [
                              Icon(Icons.info_outline_rounded,
                                size: 30, color: Colors.white),
                              Spacer(
                                flex: 1,
                              ),
                              Text("Silahkan melakukan registrasi terlebih dahulu",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20))
                            ],
                          )
                        )
                        );
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => AddPatient(userPk: int.parse(userPkStr))));
                    }
                  },
                  ))
                  )),


                  Container(
                        margin:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: TextButton(
                              onPressed: (() {
                                Navigator.pop(context);
                              }),
                              child: Text(
                                'Kembali',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue)),
                          )
                        )
                  ),
            ]
            ),
          ),
        ),
      ),
    );
  }
}