import 'package:flutter/material.dart';
import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage(
      {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
   
return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("About Us"),
      ),
      drawer: const DrawerClass(),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'About Us - PBP F04',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34)
            ),
            const Text(
              "Kelompok F04 PBP Fasilkom UI Semester Gasal 2022/2023",
              style: TextStyle(fontSize: 24)
            ),
            const Text(
              "1. Bagas Shalahuddin Wahid - 2106708904",
              style: TextStyle(fontSize: 18)
            ),
            const Text(
              "2. Maureen Esther Wijaya - 2106705335",
              style: TextStyle(fontSize: 18)
            ),
            const Text(
              "3. Muhammad Abizar Rachmanda - 2106751133",
              style: TextStyle(fontSize: 18)
            ),
            const Text(
              "4. Muhammad Arief Braja Putra - 2106702352",
              style: TextStyle(fontSize: 18)
            ),     
            const Text(
              "5. Muhammad Rizqy Ramadhan - 2106632182",
              style: TextStyle(fontSize: 18)
            ),            
          ],
        ),
      ),
    );
          
  }
}
