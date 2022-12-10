import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:flutter/material.dart';

class RequestKTPPage extends StatefulWidget {
  const RequestKTPPage({super.key});

  @override
  State<RequestKTPPage> createState() => _RequestKTPPageState();
}

class _RequestKTPPageState extends State<RequestKTPPage> {
  final _formKey = GlobalKey<FormState>();
  String _namaLengkap = "";
  double umur = 0;
  String kelasPBP = 'A';
  List<String> listKelasPBP = ['A', 'B', 'C', 'D', 'E', 'F', 'KI'];
  String permohonan = '---------';
  List<String> listPermohonan = [
    "---------",
    "Baru",
    "Penggantian",
  ];
  String kecamatan = "---------";
  List<String> listKecamatan = [
    "---------",
    "Beji",
    "Pancoran Mas",
    "Cipayung",
    "Sukmajaya",
    "Cilodong",
    "Limo",
    "Cinere",
    "Cimanggis",
    "Tapos",
    "Sawangan",
    "Bojong Sari"
  ];
  String kelurahan = "---------";
  List<String> listKelurahan = [
    "---------",
    "Beji",
    "Beji Timur",
    "Kemiri Muka",
    "Pondok Cina",
    "Kukusan",
    "Tanah Baru",
    "Pancoran Mas",
    "Depok",
    "Depok Jaya",
    "Rangkapan Jaya",
    "Rangkapan Jaya Baru",
    "Mampang",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Permohonan KTP'),
      ),
      // Menambahkan drawer menu
      drawer: const DrawerClass(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Kecamatan Option
                ListTile(
                  title: const Text(
                    'Kecamatan',
                  ),
                  trailing: DropdownButton(
                    value: kecamatan,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listKecamatan.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        kecamatan = newValue!;
                      });
                    },
                  ),
                ),

                // Kelurahan Option
                ListTile(
                  title: const Text(
                    'Kelurahan',
                  ),
                  trailing: DropdownButton(
                    value: kelurahan,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listKelurahan.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        kelurahan = newValue!;
                      });
                    },
                  ),
                ),

                // Permohonan option
                ListTile(
                  title: const Text(
                    'Kelurahan',
                  ),
                  trailing: DropdownButton(
                    value: permohonan,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listPermohonan.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        permohonan = newValue!;
                      });
                    },
                  ),
                ),

                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Pak Dengklek",
                      labelText: "Nama Lengkap",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.people),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _namaLengkap = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _namaLengkap = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama lengkap tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                // nomor kk
                // nik
                // alamat
                // rt
                // rw
                // kode pos
                // nomor hp

                // schedule date

                // schedule time
                ListTile(
                  leading: const Icon(Icons.class_),
                  title: const Text(
                    'Schedule time',
                  ),
                  trailing: DropdownButton(
                    value: kelasPBP,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listKelasPBP.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        kelasPBP = newValue!;
                      });
                    },
                  ),
                ),

                // add request button
                TextButton(
                  child: const Text(
                    "Kirim",
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
                                  Center(child: const Text('Informasi Data')),
                                  Text('Judul: ' + _namaLengkap),
                                  SizedBox(height: 20),
                                  // TODO: Munculkan informasi yang didapat dari form
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Kembali'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
