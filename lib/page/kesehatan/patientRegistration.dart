import 'dart:convert';

import 'package:depoksmartcity/utils/kesehatan/fetchRegisteredPatient.dart';
import 'package:depoksmartcity/model/kesehatan/patient.dart';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:depoksmartcity/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';


class AddPatient extends StatefulWidget {
  const AddPatient({super.key, required this.userPk});

  final int userPk;
  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final _formKey = GlobalKey<FormState>();

  String _first_name = "";
  String _last_name = "";
  String _mother_name = "";
  String _email = "";
  String _ageStr = "";
  String _address = "";

  String gender = '---------';
  List<String> listGender = [
    '---------',
    'Laki-laki',
    'Perempuan',
    'Lainnya'
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.read<CookieRequest>();
    String userPkStr = widget.userPk.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi Pasien'),
        backgroundColor: Color(0xFF003320),
      ),

      // Menambahkan drawer menu
      drawer: DrawerClass(),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        // Menggunakan padding sebesar 8 pixels
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Contoh: Dek Depe",
                            labelText: "Nama Depan",
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Menambahkan behavior saat nama diketik
                          onChanged: (String? value) {
                            setState(() {
                              _first_name = value!;
                            });
                          },
                          // Menambahkan behavior saat data disimpan
                          onSaved: (String? value) {
                            setState(() {
                              _first_name = value!;
                            });
                          },
                          // Validator sebagai validasi form
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama depan tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),

                      // Nama Belakang
                      Padding(
                        // Menggunakan padding sebesar 8 pixels
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Contoh: Dek Depe",
                            labelText: "Nama Belakang",
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Menambahkan behavior saat nama diketik
                          onChanged: (String? value) {
                            setState(() {
                              _last_name = value!;
                            });
                          },
                          // Menambahkan behavior saat data disimpan
                          onSaved: (String? value) {
                            setState(() {
                              _last_name = value!;
                            });
                          },
                          // Validator sebagai validasi form
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama belakang tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      
                      // Nama Ibu
                      Padding(
                        // Menggunakan padding sebesar 8 pixels
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Contoh: Bu A",
                            labelText: "Nama Ibu",
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Menambahkan behavior saat nama diketik
                          onChanged: (String? value) {
                            setState(() {
                              _mother_name = value!;
                            });
                          },
                          // Menambahkan behavior saat data disimpan
                          onSaved: (String? value) {
                            setState(() {
                              _mother_name = value!;
                            });
                          },
                          // Validator sebagai validasi form
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama ibu tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),

                      // Email
                      Padding(
                        // Menggunakan padding sebesar 8 pixels
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Contoh: Email@email.com",
                            labelText: "Email",
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Menambahkan behavior saat nama diketik
                          onChanged: (String? value) {
                            setState(() {
                              _email = value!;
                            });
                          },
                          // Menambahkan behavior saat data disimpan
                          onSaved: (String? value) {
                            setState(() {
                              _email = value!;
                            });
                          },
                          // Validator sebagai validasi form
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Email tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),

                      // 
                      Padding(
                        // Menggunakan padding sebesar 8 pixels
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintText: "Contoh: Dek Depe",
                            labelText: "Nama Belakang",
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                          if (value == null || value.isEmpty) {
                            
                          }
                          else {
                            try {
                              int num = int.parse(value);
                              setState(() => _ageStr = num.toString());
                            }
                            on FormatException {
                            }
                            catch(error) {
                              print(error);
                            }
                          }
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          if (value == null || value.isEmpty) {
                            
                          }
                          else {
                            try {
                              int num = int.parse(value);
                              setState(() => _ageStr = num.toString());
                            }
                            on FormatException {
                              
                            }
                            catch(error) {
                              print(error);
                            }
                          }
                    
                        },
                        ),
                      ),
                  
                  Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: const Text(
                      'Jenis Kelamin',
                    ),
                    trailing: DropdownButton(
                      value: gender,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: listGender.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          gender = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                 
                 // Alamat
                      Padding(
                        // Menggunakan padding sebesar 8 pixels
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Jln. Margonda",
                            labelText: "Alamat",
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Menambahkan behavior saat nama diketik
                          onChanged: (String? value) {
                            setState(() {
                              _address = value!;
                            });
                          },
                          // Menambahkan behavior saat data disimpan
                          onSaved: (String? value) {
                            setState(() {
                              _address = value!;
                            });
                          },
                          // Validator sebagai validasi form
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Alamat tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),

                      
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
                              "Tambah Pasien",
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
                                  Uri.parse("http://localhost:8000/kesehatan/registrasi-flutter/"),
                                  headers: <String, String>{
                                 'Content-Type': 'application/json;charset=UTF-8'
                                },
                                
                                body: jsonEncode(<String, String>{
                                'user' : userPkStr,
                                'first_name' : _first_name,
                                'last_name' : _last_name,
                                'mother_name' : _mother_name,
                                'email' : _email,
                                'gender' : gender,
                                'age' : _ageStr,
                                'address' : _address,
                            }));
                              
                              print(response.body);
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
                                        Text("Registerasi Pasien Berhasil",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20))
                                      ],
                                    )));
                              Navigator.pop(context);
                            }
                            else{
                              ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Row(
                                      children: const [
                                        Icon(Icons.info_outline_rounded,
                                            size: 30, color: Colors.white),
                                        Spacer(
                                          flex: 1,
                                        ),
                                        Text("Anda sudah teregistrasi di database Faskes Depok",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20))
                                      ],
                                    )));
                            }
                    }
                    
                  },)))),
                          
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
                                'Back',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue)),
                            ))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}