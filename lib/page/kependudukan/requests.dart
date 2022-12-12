import 'package:flutter/material.dart';
import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:depoksmartcity/page/kependudukan/request_ktp.dart';
import 'package:depoksmartcity/utils/kependudukan/fetchRequests.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  final TextStyle h1 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 11, 51, 74));
  final TextStyle h2 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 11, 51, 74));
  final TextStyle h3 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 11, 51, 74));
  final TextStyle boldText = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 11, 51, 74));
  final TextStyle plainText = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 11, 51, 74));

  @override
  Widget build(BuildContext context) {
    final request = context.read<CookieRequest>();
    print(request.loggedIn);
    print(request.jsonData);
    return Scaffold(
      appBar: AppBar(
        title: Text('Kependudukan'),
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 11, 51, 74)),
        ),
      ),
      drawer: const DrawerClass(),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 11, 51, 74),
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RequestKTPPage()),
                    );
                  },
                  child: const Text('Buat Request KTP'),
                ),
                const SizedBox(height: 30),
                Text(
                  'Daftar Request KTP',
                  style: h1,
                ),
                const SizedBox(height: 30),
                FutureBuilder(
                  future: fetchRequests(request.jsonData['username']),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (!snapshot.hasData) {
                        return Column(
                          children: const [
                            Text(
                              "Belum ada request KTP",
                              style: TextStyle(
                                  color: Color(0xff59A5D8), fontSize: 20),
                            ),
                            SizedBox(height: 8),
                          ],
                        );
                      } else {
                        return ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 235, 236, 235),
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color.fromARGB(255, 106, 110, 126),
                                  width: 2,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Request ${snapshot.data![index].fields.requestedAt}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                    "Provinsi: ${snapshot.data![index].fields.provinsi}"),
                                Text(
                                    "Kota: ${snapshot.data![index].fields.kota}"),
                                Text(
                                    "Kecamatan: ${snapshot.data![index].fields.kecamatan}"),
                                Text(
                                    "Kelurahan: ${snapshot.data![index].fields.kelurahan}"),
                                Text(
                                    "Permohonan: ${snapshot.data![index].fields.permohonan}"),
                                Text(
                                    "Nama Lengkap: ${snapshot.data![index].fields.namaLengkap}"),
                                Text(
                                    "Nomor KK: ${snapshot.data![index].fields.nomorKk}"),
                                Text(
                                    "NIK: ${snapshot.data![index].fields.nik}"),
                                Text(
                                    "Alamat: ${snapshot.data![index].fields.alamat}"),
                                Text("RT: ${snapshot.data![index].fields.rt}"),
                                Text("RW: ${snapshot.data![index].fields.rw}"),
                                Text(
                                    "Kode Pos: ${snapshot.data![index].fields.kodePos}"),
                                Text(
                                    "Nomor HP: ${snapshot.data![index].fields.nomorHp}"),
                                Text("Jadwal Pemotretan Foto"),
                                Text(
                                    "${snapshot.data![index]} ${snapshot.data![index].fields.scheduleTime} WIB"),
                              ],
                            ),

                            // ),
                          ),
                        );
                      }
                    }
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
