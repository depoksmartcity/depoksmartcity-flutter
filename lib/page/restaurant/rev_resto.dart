import 'package:flutter/material.dart';
import 'package:depoksmartcity/page/restaurant/add_rev.dart';
import 'package:depoksmartcity/page/restaurant/detail_restaurant.dart';
import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:depoksmartcity/model/restaurant/restaurant.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:depoksmartcity/page/auth/login.dart';



class MyRevPage extends StatefulWidget {
  const MyRevPage({super.key});

    // Restaurants data;

  @override
  State<MyRevPage> createState() => _MyRevState();
}

class _MyRevState extends State<MyRevPage> {

  @override
  Widget build(BuildContext context) {
    final request = context.read<CookieRequest>();

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
              title:Text(item.namaResto),subtitle:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    child: const Icon(Icons.add),

                    onPressed: () 
                        {
                            if (request.loggedIn) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyFormPage()),
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
                        }

                    // () =>
                    //     Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => const MyFormPage()),
                    //     ),

                ),

                ],
            )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}