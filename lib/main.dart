import 'package:depoksmartcity/page/kesehatan/patientRegistration.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:depoksmartcity/model/kesehatan/healthFacility.dart';
import 'package:depoksmartcity/page/kesehatan/kesehatanMain.dart';
import 'package:depoksmartcity/page/kesehatan/healthFacilites.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: MaterialApp(
          title: 'Depok Smart City Mobile',
          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),

          home: const MyHomePage(title: 'Depok Smart City Mobile'),
          routes: {},
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: const DrawerClass(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Selamat Datang di Depok Smart City Mobile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34)
            ),
            Text(
              "Depok Smart City Mobile adalah aplikasi mobile Kota Depok dengan berbagai fitur dalam satu aplikasi.",
              style: TextStyle(fontSize: 24)
            ),
            Text(
              "Fitur - fitur tersebut terdiri dari kependudukan, aspirasi, restoran, kesehatan, dan perpustakaan.",
              style: TextStyle(fontSize: 24)
            ),
          ],
        ),
      ),
    );
  }
}