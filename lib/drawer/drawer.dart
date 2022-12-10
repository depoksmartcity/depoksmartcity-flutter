import 'package:depoksmartcity/main.dart';
import 'package:depoksmartcity/page/auth/login.dart';
import 'package:depoksmartcity/page/auth/register.dart';
import 'package:depoksmartcity/page/aspirasi/aspirasi.dart';
import 'package:depoksmartcity/page/kependudukan/kependudukan.dart';
import 'package:depoksmartcity/page/restaurant/restaurant.dart';
import 'package:flutter/material.dart';

class DrawerClass extends StatefulWidget {
  const DrawerClass({Key? key}) : super(key: key);

  @override
  _DrawerClassState createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Untuk yang menu counter_7
          ListTile(
            leading: Icon(Icons.home),
            title: const Text("counter_7"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MyHomePage(title: 'Flutter Demo Home Page')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: const Text("Login"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.app_registration_rounded),
            title: const Text("Register"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: const Text("Aspirasi"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AspirasiPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: const Text("Kependudukan"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const KependudukanPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Restaurant"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const RestaurantPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Kesehatan"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const KependudukanPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
