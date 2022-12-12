import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:depoksmartcity/page/auth/login.dart';
import 'package:depoksmartcity/model/kesehatan/healthFacility.dart';
import 'package:depoksmartcity/utils/kesehatan/fetchHealthFacilities.dart';

class HealthFacilites extends StatefulWidget {
  const HealthFacilites({super.key});

  @override
  State<HealthFacilites> createState() => _HealthFacilitesState();
}

class _HealthFacilitesState extends State<HealthFacilites> {
  final TextStyle h1 = const TextStyle(
    fontSize: 24, fontWeight: FontWeight.w600, color: Colors.blueGrey);
  final TextStyle h2 = const TextStyle(
    fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blueGrey);
  final TextStyle h3 = const TextStyle(
    fontSize: 14, fontWeight: FontWeight.w600, color: Colors.blueGrey);
  final TextStyle boldText = const TextStyle(
    fontSize: 14, fontWeight: FontWeight.w600, color: Colors.blueGrey);
  final TextStyle plainText = const TextStyle(
    fontSize: 14, fontWeight: FontWeight.w400, color: Colors.blueGrey);
  
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    print(request.loggedIn);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Fasilitas Kesehatan'),
        backgroundColor: Color(0xFF003320),
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
                  'Daftar Fasilitas Kesehatan',
                    style: h1,
                  ),
              
                const SizedBox(height: 30),
                
                FutureBuilder(
                  future: fetchHealthFacilities(),
                  
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    
                    } else {
                      if (snapshot.data.isEmpty) {
                        return Column(
                          children: const [
                            Text(
                              "Tidak ada Faskes yang tercatat :(",
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
                              Container(
                                width: 350,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 89, 94, 102),
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
                                        "Alamat : ${snapshot.data![index].fields.address}"),
                                    Text(
                                        "\nNo. Telp : ${snapshot.data![index].fields.phone_number}"),
                                    Container(
                                      margin:
                                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: ElevatedButton(
                                            onPressed: (() {
                                                Clipboard.setData(
                                                  ClipboardData(text: "${snapshot.data![index].fields.address_url}"));
                                                }),
                                            child: Text(
                                              'Copy URL Peta',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(Colors.green)),
                                          ))),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        );
                      }
                    }
                  },
                ),
                const SizedBox(height: 30),
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
                        'Kembali',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue)),
                      )
                    )
                  ),
              ]
            ),
          )
        ),
      ),
    );
  }
}