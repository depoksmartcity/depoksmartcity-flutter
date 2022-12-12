import 'package:depoksmartcity/model/restaurant/restaurant.dart';
import 'package:depoksmartcity/page/restaurant/detail_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:depoksmartcity/page/restaurant/rev_resto.dart';
import 'package:flutter/services.dart';
import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:depoksmartcity/model/restaurant/fetch_restaurant.dart';


class Review {
  String review;
  String namaResto; 
  DateTime date;

  Review(this.review, this.date, this.namaResto);
}

class Add {
  static List<Review> contain = <Review>[];
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _review = "";
  DateTime date = DateTime.now();
  String nama_resto = "KFC";
  List<String> listNama = [];

  @override
  void initState() {
    super.initState();

    fetchRestaurant().then((data) => {
        for (var element in data) {
            setState(() {
            listNama.add(element.fields.name);
          })
        }

        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Review Form"),
      ),
      // Menambahkan drawer menu
      drawer: const DrawerClass(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Ulasan",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _review = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _review = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Ulasan tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),  
              
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: "Pilih Restoran",
                ),
                child: DropdownButton<String>(
                  value: nama_resto,
                  items: listNama.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      nama_resto = value!;
                    });
                  },
                ),
              ),
            ),

              OutlinedButton.icon(
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(1945),
                            lastDate: DateTime(2077))
                        .then((selectedDate) {
                      setState(() {
                        if (selectedDate != null) {
                          date = selectedDate;
                        }
                      });
                    });
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
                  icon: const Icon(Icons.date_range),
                  label: const Text("Pilih Tanggal (Default tanggal sekarang)")),
              TextButton(
                child: const Text(
                  "Simpan",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 15,
                          child: Container(
                            child: ListView(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              shrinkWrap: true,
                              children: <Widget>[
                                Center(
                                    child: const Text(
                                        'Berhasil Menambahkan Data')),
                                SizedBox(height: 20),
                                TextButton(
                                  onPressed: (){
                                    Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => MyRevPage()));
                                    },
                                  child: Text('Kembali'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                    Add.contain.add(Review(_review, date, nama_resto));
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}