import 'package:flutter/material.dart';
import 'package:depoksmartcity/page/restaurant/add_rev.dart';
import 'package:depoksmartcity/page/restaurant/detail_restaurant.dart';
import 'package:depoksmartcity/drawer/drawer.dart';


class MyRevPage extends StatefulWidget {
  const MyRevPage({super.key});

  @override
  State<MyRevPage> createState() => _MyRevState();
}

class _MyRevState extends State<MyRevPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form"),
        ),
        // Menambahkan drawer menu
        drawer: const DrawerClass(),
        body: ListView.builder(
          itemCount: Add.contain.length,
          itemBuilder: (context, index) {
            final item = Add.contain[index];
            return ListTile(
              title:Text("Ulasan"),subtitle:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[Text(item.review), Text("Tanggal : "+item.date.toString().substring(0,10))]),

            );
          },
        ),
        floatingActionButton: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                FloatingActionButton(
                    onPressed:() =>
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const MyFormPage()),
                        ),
                    child: const Icon(Icons.add),
                ),
                ],
            )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
  }
}