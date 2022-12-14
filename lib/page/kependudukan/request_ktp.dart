import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class RequestKTPPage extends StatefulWidget {
  const RequestKTPPage({super.key});

  @override
  State<RequestKTPPage> createState() => _RequestKTPPageState();
}

class _RequestKTPPageState extends State<RequestKTPPage> {
  final TextStyle h1 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 11, 51, 74));

  final _formKey = GlobalKey<FormState>();
  String _namaLengkap = "";
  String _nomorKk = "";
  String _nik = "";
  String _alamat = "";
  String _rt = "";
  String _rw = "";
  String _kodePos = "";
  String _noHp = "";
  DateTime? _scheduleDate;
  String _scheduleTime = "";

  String timeslot = '---------';
  List<String> listTimeslot = [
    '---------',
    '08:00 - 08:15',
    '08:15 - 08:30',
    '08:30 - 08:45',
    '08:45 - 09.00',
    '09:00 - 09:15',
    '09:15 - 09:30',
    '09:30 - 09:45',
    '09:45 - 10.00',
    '10:00 - 10:15',
    '10:15 - 10:30',
    '10:30 - 10:45',
    '10:45 - 11.00',
    '11:00 - 11:15',
    '11:15 - 11:30',
    '11:30 - 11:45',
    '11:45 - 12.00',
    '13:00 - 13:15',
    '13:15 - 13:30',
    '13:30 - 13:45',
    '13:45 - 14.00',
    '14:00 - 14:15',
    '14:15 - 14:30',
    '14:30 - 14:45',
    '14:45 - 15.00',
  ];
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
  String kelurahan = "Pilih kecamatan terlebih dahulu";
  List<String> listKelurahan = [
    "Pilih kecamatan terlebih dahulu",
  ];
  List<String> listKelurahanBeji = [
    "---------",
    "Beji",
    "Beji Timur",
    "Kemiri Muka",
    "Pondok Cina",
    "Kukusan",
    "Tanah Baru",
  ];
  List<String> listKelurahanPancoranMas = [
    "---------",
    "Pancoran Mas",
    "Depok",
    "Depok Jaya",
    "Rangkapan Jaya",
    "Rangkapan Jaya Baru",
    "Mampang",
  ];
  List<String> listKelurahanCipayung = [
    "---------",
    "Cipayung",
    "Cipayung Jaya",
    "Ratu Jaya",
    "Bojong Pondok Terong",
    "Pondok Jaya",
  ];
  List<String> listKelurahanSukmajaya = [
    "---------",
    "Sukmajaya",
    "Mekar Jaya",
    "Bakti Jaya",
    "Abadi Jaya",
    "Tirta Jaya",
    "Cisalak",
  ];
  List<String> listKelurahanCilodong = [
    "---------",
    "Sukamaju",
    "Cilodong",
    "Kalibaru",
    "Kalimulya",
    "Jatimulya",
  ];
  List<String> listKelurahanLimo = [
    "---------",
    "Limo",
    "Meruyung",
    "Grogol",
    "Krukut",
  ];
  List<String> listKelurahanCinere = [
    "---------",
    "Cinere",
    "Gandul",
    "Pengkalan Jati",
    "Pangkalan Jati Baru",
  ];
  List<String> listKelurahanCimanggis = [
    "---------",
    "Cisalak Pasar",
    "Mekarsari",
    "Tugu",
    "Pasir Gunung Selatan",
    "Harjamukti",
    "Curug",
  ];
  List<String> listKelurahanTapos = [
    "---------",
    "Tapos",
    "Leuwinanggung",
    "Sukatani",
    "Sukamaju Baru",
    "Jatijajar",
    "Cilangkap",
    "Cimpaeun",
  ];
  List<String> listKelurahanSawangan = [
    "---------",
    "Sawangan",
    "Kedaung",
    "Cinangka",
    "Sawangan Baru",
    "Bedahan",
    "Pengasinan",
    "Pasir Putih",
  ];
  List<String> listKelurahanBojongSari = [
    "---------",
    "Bojong Sari",
    "Bojongsari Baru",
    "Serua",
    "Pondok Petir",
    "Curug",
    "Duren Mekar",
    "Duren Seribu",
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.read<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kependudukan'),
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 11, 51, 74)),
        ),
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
                Text(
                  'Daftar Request KTP',
                  style: h1,
                ),
                // Kecamatan Option
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
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
                          if (kecamatan == "---------") {
                            kelurahan = "Pilih kecamatan terlebih dahulu";
                            listKelurahan = [
                              "Pilih kecamatan terlebih dahulu",
                            ];
                          } else if (kecamatan == 'Beji') {
                            listKelurahan = listKelurahanBeji;
                            kelurahan = listKelurahanBeji[0];
                          } else if (kecamatan == 'Pancoran Mas') {
                            listKelurahan = listKelurahanPancoranMas;
                            kelurahan = listKelurahanPancoranMas[0];
                          } else if (kecamatan == 'Cipayung') {
                            listKelurahan = listKelurahanCipayung;
                            kelurahan = listKelurahanCipayung[0];
                          } else if (kecamatan == 'Sukmajaya') {
                            listKelurahan = listKelurahanSukmajaya;
                            kelurahan = listKelurahanSukmajaya[0];
                          } else if (kecamatan == 'Cilodong') {
                            listKelurahan = listKelurahanCilodong;
                            kelurahan = listKelurahanCilodong[0];
                          } else if (kecamatan == 'Limo') {
                            listKelurahan = listKelurahanLimo;
                            kelurahan = listKelurahanLimo[0];
                          } else if (kecamatan == 'Cinere') {
                            listKelurahan = listKelurahanCinere;
                            kelurahan = listKelurahanCinere[0];
                          } else if (kecamatan == 'Cimanggis') {
                            listKelurahan = listKelurahanCimanggis;
                            kelurahan = listKelurahanCimanggis[0];
                          } else if (kecamatan == 'Tapos') {
                            listKelurahan = listKelurahanTapos;
                            kelurahan = listKelurahanTapos[0];
                          } else if (kecamatan == 'Sawangan') {
                            listKelurahan = listKelurahanSawangan;
                            kelurahan = listKelurahanSawangan[0];
                          } else if (kecamatan == 'Bojong Sari') {
                            listKelurahan = listKelurahanBojongSari;
                            kelurahan = listKelurahanBojongSari[0];
                          }
                        });
                      },
                    ),
                  ),
                ),

                // Kelurahan Option
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
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
                ),

                // Permohonan option
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: const Text(
                      'Permohonan',
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
                ),

                // nama lengkap
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Pak Dengklek",
                      labelText: "Nama Lengkap",
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
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: 012345678910",
                      labelText: "Nomor KK",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _nomorKk = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _nomorKk = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nomor KK tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                // nik
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: 012345678910",
                      labelText: "NIK",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _nik = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _nik = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'NIK tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                // alamat
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Jl. Haji Ahmat",
                      labelText: "Alamat",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _alamat = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _alamat = value!;
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

                // rt
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: 6",
                      labelText: "RT",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _rt = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _rt = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'RT tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                // rw
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: 22",
                      labelText: "RW",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _rw = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _rw = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'RW tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                // kode pos
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: 12345",
                      labelText: "Kode Pos",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _kodePos = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _kodePos = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Kode pos tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                // nomor hp
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: 012345678910",
                      labelText: "Nomor HP",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _noHp = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _noHp = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nomor HP tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                // schedule date
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    child: Text(_scheduleDate == null
                        ? "Pilih tanggal"
                        : "${_scheduleDate!.day}/${_scheduleDate!.month}/${_scheduleDate!.year}"),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2099),
                      ).then((date) {
                        setState(() {
                          _scheduleDate = date;
                        });
                      });
                    },
                  ),
                ),

                // schedule time
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: const Text(
                      'Schedule time',
                    ),
                    trailing: DropdownButton(
                      value: timeslot,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: listTimeslot.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          timeslot = newValue!;
                          _scheduleTime = timeslot;
                        });
                      },
                    ),
                  ),
                ),

                // add request button
                TextButton(
                  child: const Text(
                    "Kirim",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 11, 51, 74)),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await http.post(
                          Uri.parse(
                              "https://web-production-1710.up.railway.app/kependudukan/request-ktp/add-flutter"),
                          // 'http://localhost:8000/kependudukan/request-ktp/add-flutter'),
                          headers: <String, String>{
                            'Content-Type': 'application/json;charset=UTF-8'
                          },
                          body: jsonEncode(<String, String>{
                            'username': request.jsonData['username'],
                            'kecamatan': kecamatan,
                            'kelurahan': kelurahan,
                            'permohonan': permohonan,
                            'nama_lengkap': _namaLengkap,
                            'nomor_kk': _nomorKk,
                            'nik': _nik,
                            'alamat': _alamat,
                            'rt': _rt,
                            'rw': _rw,
                            'kode_pos': _kodePos,
                            'nomor_hp': _noHp,
                            'schedule_date': ("${_scheduleDate?.year}" +
                                "-" +
                                "${_scheduleDate?.month}" +
                                "-" +
                                "${_scheduleDate?.day}"),
                            'schedule_time': _scheduleTime,
                          }));
                      print(response.body);
                      var jsonData = jsonDecode(response.body);
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
