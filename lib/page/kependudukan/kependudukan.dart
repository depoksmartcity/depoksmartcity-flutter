import 'package:depoksmartcity/page/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:depoksmartcity/page/kependudukan/request_ktp.dart';
import 'package:depoksmartcity/utils/kependudukan/fetchKelurahan.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:depoksmartcity/page/kependudukan/requests.dart';

class KependudukanPage extends StatefulWidget {
  const KependudukanPage({super.key});

  @override
  State<KependudukanPage> createState() => _KependudukanPageState();
}

class _KependudukanPageState extends State<KependudukanPage> {
  final TextStyle h1 = TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600, color: Colors.blueGrey);
  final TextStyle h2 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blueGrey);
  final TextStyle h3 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.blueGrey);
  final TextStyle boldText = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.blueGrey);
  final TextStyle plainText = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: Colors.blueGrey);

  @override
  Widget build(BuildContext context) {
    final request = context.read<CookieRequest>();
    print(request.loggedIn);
    print(request.jsonData);
    String kecamatan = "";

    return Scaffold(
      appBar: AppBar(
        title: Text('Kependudukan'),
      ),
      drawer: const DrawerClass(),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Layanan request bikin KTP dan penjadwalan sesi foto',
                  style: h1,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {
                    if (request.loggedIn) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RequestsPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: const [
                              Icon(Icons.warning_amber_rounded,
                                  size: 30, color: Colors.white),
                              Spacer(
                                flex: 1,
                              ),
                              Text("Please login first",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20))
                            ],
                          ),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    }
                  },
                  child: const Text('Request KTP'),
                ),
                const SizedBox(height: 30),
                Text(
                  'Daftar Kelurahan',
                  style: h1,
                ),
                FutureBuilder(
                  future: fetchKelurahan(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (!snapshot.hasData) {
                        return Column(
                          children: const [
                            Text(
                              "Tidak ada kelurahan tercatat :(",
                              style: TextStyle(
                                  color: Color(0xff59A5D8), fontSize: 20),
                            ),
                            SizedBox(height: 8),
                          ],
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => Column(
                            children: [
                              Builder(
                                builder: ((context) {
                                  if (index == 0) {
                                    return Column(children: [
                                      const SizedBox(height: 20),
                                      Text(
                                        "\nKecamatan ${snapshot.data![index].fields.kecamatan}",
                                        style: h2,
                                      ),
                                    ]);
                                  } else if (snapshot
                                          .data![index].fields.kecamatan !=
                                      snapshot
                                          .data![index - 1].fields.kecamatan) {
                                    return Column(children: [
                                      const SizedBox(height: 20),
                                      Text(
                                        "\nKecamatan ${snapshot.data![index].fields.kecamatan}",
                                        style: h2,
                                      ),
                                    ]);
                                  }
                                  return const SizedBox(height: 20);
                                }),
                              ),
                              Container(
                                width: 350,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 76, 188, 165),
                                      width: 3,
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
                                      "${snapshot.data![index].fields.name}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.address}"),
                                  ],
                                ),

                                // ),
                              ),
                            ],
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
