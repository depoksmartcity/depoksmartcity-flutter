import 'package:flutter/material.dart';
import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:depoksmartcity/page/kependudukan/request_ktp.dart';

class KependudukanPage extends StatefulWidget {
  const KependudukanPage({super.key});

  @override
  State<KependudukanPage> createState() => _KependudukanPageState();
}

class _KependudukanPageState extends State<KependudukanPage> {
  final TextStyle h1 = TextStyle(
      fontSize: 26, fontWeight: FontWeight.w500, color: Colors.blueGrey);
  final TextStyle h2 = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w300, color: Colors.blueGrey);
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
                  child: const Text('Request KTP'),
                ),
                const SizedBox(height: 30),
                Text(
                  'Daftar Kelurahan',
                  style: h2,
                ),
                const SizedBox(height: 30),
                Text('Kecamatan Beji'),
                const SizedBox(height: 30),
                Text('Kecamatan Pancoran Mas'),
                const SizedBox(height: 30),
                Text('Kecamatan Cipayung'),
                const SizedBox(height: 30),
                Text('Kecamatan Sukmajaya'),
                const SizedBox(height: 30),
                Text('Kecamatan Cilodong'),
                const SizedBox(height: 30),
                Text('Kecamatan Limo'),
                const SizedBox(height: 30),
                Text('Kecamatan Cinere'),
                const SizedBox(height: 30),
                Text('Kecamatan Cimanggis'),
                const SizedBox(height: 30),
                Text('Kecamatan Tapos'),
                const SizedBox(height: 30),
                Text('Kecamatan Sawangan'),
                const SizedBox(height: 30),
                Text('Kecamatan Bojong Sari'),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
