import 'package:depoksmartcity/page/aspirasi/aspirasi_add.dart';
import 'package:depoksmartcity/page/aspirasi/aspirasi_user.dart';
import 'package:flutter/material.dart';
import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:depoksmartcity/utils/aspirasi/aspirasiFunction.dart';

import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class AspirasiPage extends StatefulWidget {
  const AspirasiPage({super.key});

  @override
  State<AspirasiPage> createState() => _AspirasiPageState();
}

class _AspirasiPageState extends State<AspirasiPage> {
  UseAspirasi useAspirasi = UseAspirasi();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          'Aspirasi',
        ),
      ),
      // backgroundColor: Colors.pink,
      drawer: const DrawerClass(),
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: const AssetImage("lib/assets/kota-depok-aspirasi.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
          )),
          child: Column(
            children: [
              TextButton(
                child: const Text(
                  "Lihat Aspirasi Saya",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AspirasiPageUser()));
                }
              ),
              TextButton(
                child: const Text(
                  "Tambah Aspirasi",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddAspirasiPage()));
                }
              ),
              FutureBuilder(
              future: useAspirasi.fetchAspirasi(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return Column(
                      children: const [
                        Text(
                          "Tidak ada Aspirasi!",
                          style:
                              TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black, blurRadius: 2.0)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${snapshot.data![index].fields.aspirasi}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ));
                  }
                }
              })
            ],
          )
          
              ),
    );
  }
}
