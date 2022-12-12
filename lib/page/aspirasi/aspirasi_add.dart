import 'dart:convert';

import 'package:depoksmartcity/page/aspirasi/aspirasi.dart';
import 'package:flutter/material.dart';
import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class AddAspirasiPage extends StatefulWidget {
  const AddAspirasiPage({super.key});

  @override
  State<AddAspirasiPage> createState() => _AddAspirasiPageState();
}

class _AddAspirasiPageState extends State<AddAspirasiPage> {
  final _formKey = GlobalKey<FormState>();
  String aspirasiAdded = "";

  @override
  Widget build(BuildContext context) {
    final request = context.read<CookieRequest>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambahkan Aspirasimu"),
      ),
      drawer: const DrawerClass(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Aspirasi",
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        aspirasiAdded = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Aspirasi tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                TextButton(
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await request.post(
                        "https://web-production-1710.up.railway.app/aspirasi/add-aspirasi-flutter/",
                        jsonEncode(<String, String>{
                          'aspirasi': aspirasiAdded,
                        }));
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: ListView(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                shrinkWrap: true,
                                children: <Widget>[
                                  const Center(child: Text('Informasi Data')),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Data Sudah Ditambahkan',
                                    textAlign: TextAlign.center,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Kembali'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    }),
                  TextButton(
                  child: const Text(
                    "Kembali",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AspirasiPage()));
                  }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
