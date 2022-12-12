import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:depoksmartcity/main.dart';
import 'package:flutter/services.dart';
import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:depoksmartcity/page/perpustakaan/detailBook.dart';


class AddBookReview extends StatefulWidget {
  const AddBookReview({super.key, required this.bookPk});

  final int bookPk;
  @override
  State<AddBookReview> createState() => _AddBookReviewState();
}

class _AddBookReviewState extends State<AddBookReview> {
  final _formKey = GlobalKey<FormState>();
  final _rateController = TextEditingController();
  int _rate = 0;
  String _review = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Review'),
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
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          hintText: "Rate (1 - 5)",
                          labelText: "Rate",
                          // Menambahkan icon agar lebih intuitif
                          icon: const Icon(Icons.numbers),
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          if (value == null || value.isEmpty) {
                            
                          }
                          else {
                            try {
                              int num = int.parse(value);
                              setState(() => _rate = num);
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
                              setState(() => _rate = num);
                            }
                            on FormatException {
                              
                            }
                            catch(error) {
                              print(error);
                            }
                          }
                    
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Rate can not be empty!';
                          }
                          else {
                            try {
                              int num = int.parse(value);
                              if (num <= 0) {
                                return 'Rate can not be lower than 1.';
                              }
                              else if (num > 5) {
                                return 'Rate can not be higher than 5.';
                              }

                              setState(() => _rate = num);
                            }
                            on FormatException {
                              return 'Rate must be a positive integer.';
                            }
                            catch(error) {
                              print(error);
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Review",
                          labelText: "Review",
                          // Menambahkan icon agar lebih intuitif
                          icon: const Icon(Icons.description),
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          // String _nominal = _nominalController.text;
                          // int.parse(_nominal);
                          setState(() {
                            _review = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          // String _nominal = _nominalController.text;
                          // int.parse(_nominal);
                          setState(() {
                            _review = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Review can not be empty!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
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
                              "Add Review",
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
                              String msg = "";
                              int bookPk = widget.bookPk;
                              // try {
                              print("ini pk $bookPk");
                              print("ini review $_review");
                              print("ini rate $_rate");
                              try {
                              final response = await request.post(
                                "https://web-production-1710.up.railway.app/perpustakaan/book/$bookPk/review",
                                {
                                  'review': _review,
                                  'rate': _rate.toString(),
                                },
                              );
                              }
                              catch (error) {
                                print(error);
                              }
                              // }
                              // catch (error) {
                              //   print(error);
                              // }

                              // Code here will run if the login succeeded.
                              int count = 0;
                              Navigator.of(context).popUntil((_) => count++ >= 2);

                              // Code here will run if the login failed (wrong username/password).
                            },
                          )),
                        ),
                      ),
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