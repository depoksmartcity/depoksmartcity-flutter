import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:http/http.dart' as http;

import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:depoksmartcity/page/auth/login.dart';
import 'package:depoksmartcity/page/kesehatan/createAppointment.dart';
import 'package:depoksmartcity/page/kesehatan/patientRegistration.dart';
import 'package:depoksmartcity/utils/kesehatan/fetchAppointment.dart';
import 'package:depoksmartcity/page/kesehatan/widgets/roundedBorderedContainer.dart';

class KesehatanPage extends StatefulWidget {
  const KesehatanPage({super.key});

  @override
  State<KesehatanPage> createState() => _KesehatanPageState();
}

class _KesehatanPageState extends State<KesehatanPage> {
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
    final request = context.read<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Layanan Kesehatan'),
        backgroundColor: Color(0xFF003320),
      ),
      
      drawer: const DrawerClass(),
      
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          _buildCarouselLayanan(),
          const SizedBox(height: 10.0),
          
          _buildHeading("Jenis Layanan"),
          
          // Layanan registrasi pasien
          InkWell(
          onTap: () {
            if (request.jsonData['id'] == null){        // Jika user belum login, akan direct ke halaman login
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage()));

              } else {
                int userId = request.jsonData['id'];
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => AddPatient(userPk: userId)));
              }
          },

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    image: const DecorationImage(
                      image: NetworkImage("https://dinkes.depok.go.id/assets/img/icon/regis.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                Expanded(
                  child: Column(
                    children: const <Widget>[

                      Text(
                        "Registrasi Pasien",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),

                      Text(
                        "Mempercepat kinerja pelayanan Puskesmas dan Rumah Sakit dalam segi Pendataan Pasien."),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        
        // Layanan Penjadwalan Konsultasi
        InkWell(
          onTap: () {
            if (request.jsonData['id'] == null){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage()));
              
              } else {
                int userId = request.jsonData['id'];
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => AddAppointment(userPk: userId)));
              }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    image: const DecorationImage(
                      image: NetworkImage("https://dinkes.depok.go.id/assets/img/icon/dokter.png"),
                      fit: BoxFit.contain,
                    )
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const <Widget>[
                      Text(
                        "Jadwalkan Konsultasi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      
                      Text(
                        "Jadwalkan Konsultasi dan Cek Antrian RSUD dan Puskesmas."),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        

        // Tampilkan Fasilitas Kesehatan
        InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/kesehatan/health-facilities");
        },

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                    image: const DecorationImage(
                      image: NetworkImage("https://dinkes.depok.go.id/assets/img/icon/hospital%20(4).png"),
                      fit: BoxFit.contain,
                  )
                ),
              ),
              
              Expanded(
                child: Column(
                  children: const <Widget>[
                    Text(
                      "Daftar Fasilitas Kesehatan",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Cek daftar Puskesmas dan Rumah sakit tujuanmu dengan alamat lengkap dan narahubung."),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

          
      _buildHeading("Daftar Konsultasi Anda"),
          
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: <Widget>[
                if (request.jsonData['id'] == null)...[
                Column(
                  children: const [
                    Text(
                      "Anda belum terdaftar sebagai pasien :( ",
                      style: TextStyle(
                          color: Color(0xFF003320), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ]else...[
                // Menampilkan appointment user
                FutureBuilder(
                future: fetchAppointment(request.jsonData['id']),
                builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Column(
                          children: const [
                            Text(
                              "Anda belum terdaftar sebagai pasien :( ",
                              style: TextStyle(
                                color: Color(0xFF003320), fontSize: 20),
                              ),
                            SizedBox(height: 8),
                          ],
                        );

                    } else {
                      if (snapshot.data.isEmpty) {
                        return Column(
                          children: const [
                            Text(
                              "Belum ada jadwal konsultasi :( ",
                              style: TextStyle(
                                  color: Color(0xFF003320), fontSize: 20),
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
                                      const SizedBox(height : 7),
                                      Text(
                                        "\nFasilitas Kesehatan : ${snapshot.data![index].fields.facility_name}",
                                        style: h3,
                                      ),
                                    ]);
                                  } else if (snapshot
                                          .data![index].fields.facility_name!=
                                      snapshot
                                          .data![index - 1].fields.facility_name) {
                                    return Column(children: [
                                      const SizedBox(height: 10),
                                      Text(
                                        "\nFasilitas Kesehatan : ${snapshot.data![index].fields.facility_name}",
                                        style: h3,
                                      ),
                                    ]);
                                  }
                                  return const SizedBox(height: 7);
                                }),
                              ),
                              Container(
                                width: 200,
                                margin: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                      color: Color(0xFF003320),
                                      width: 3,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0xFF003320), blurRadius: 1.0)
                                    ]),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    
                                    Text(
                                      "Tanggal\t : ${snapshot.data![index].fields.date?.day} - ${snapshot.data![index].fields.date?.month} - ${snapshot.data![index].fields.date?.year} " ,
                                      style: const TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      "\nWaktu \t : ${snapshot.data![index].fields.timeslot}",
                                      style: const TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    // Tombol untuk menghapus appointment
                                    Container(
                                      margin:
                                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: TextButton(
                                            onPressed: (() async {
                                              String pkStr = snapshot.data![index].pk.toString();
                                              final response = await http.post(
                                                Uri.parse("https://web-production-1710.up.railway.app/kesehatan/delete-appointment-flutter/${snapshot.data![index].pk}"),
                                                headers: <String, String>{
                                                'Content-Type': 'application/json;charset=UTF-8'
                                              },
                                              
                                              body: jsonEncode(<String, String>{
                                              'appointmentId' : pkStr,
                                              }));
                                            
                                            Navigator.pushNamed(context, '/kesehatan');
                                            }
                                          ),  
                                          child: Text(
                                            'Hapus',
                                            style: TextStyle(color: Colors.white),
                                            ),
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.red)),
                                      
                                      )
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  }
                )
              ],
              const SizedBox(height: 30),
            ],
          ),
        ),

        const SizedBox(height: 10.0),
        ]
      ),
    );
  }

  // Membuat heading 
  Padding _buildHeading(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.grey.shade600),
            ),
          ),
        ],
      ),
    );
  }
  
  // Membuat carousel jenis-jenis layanan
  RoundedContainer _buildCarouselLayanan() {
    return RoundedContainer(
      height: 270,
      borderRadius: BorderRadius.circular(0),
      color: Color(0xFF003320),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2)),
                items: [1,2,3].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      if (i == 1){
                          return RoundedContainer(
                          borderRadius: BorderRadius.circular(4.0),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Daftar Fasilitas Kesehatan",
                            style: h2,
                          ),
                          
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.white,
                            child: Image.network("https://dinkes.depok.go.id/assets/img/icon/hospital%20(4).png",
                              fit: BoxFit.scaleDown,
                              height: 100,
                            ),
                          ),
                        )
                    ]));                    

                    }else if(i==2){
                      return RoundedContainer(
                        borderRadius: BorderRadius.circular(4.0),
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Registrasi Online Pasien",
                            style: h2,
                          ),
                          
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.white,
                            child: Image.network("https://dinkes.depok.go.id/assets/img/icon/regis.png",
                              fit: BoxFit.scaleDown,
                              height: 100,
                            ),
                          ),
                        )
                    ]));
                    
                    }else{
                      return RoundedContainer(
                        borderRadius: BorderRadius.circular(4.0),
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Jadwalkan Konsultasi",
                            style: h2,
                          ),
                          
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.white,
                            child: Image.network("https://dinkes.depok.go.id/assets/img/icon/dokter.png",
                              fit: BoxFit.scaleDown,
                              height: 100,
                            ),
                          ),
                        )
                    ]));
                    }
                  }
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}