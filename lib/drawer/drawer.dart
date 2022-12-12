import 'package:depoksmartcity/main.dart';
import 'package:depoksmartcity/page/auth/login.dart';
import 'package:depoksmartcity/page/auth/register.dart';
import 'package:depoksmartcity/page/aspirasi/aspirasi.dart';
import 'package:depoksmartcity/page/kependudukan/kependudukan.dart';
import 'package:depoksmartcity/page/perpustakaan/showBook.dart';
import 'package:depoksmartcity/page/restaurant/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

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
    final request = context.read<CookieRequest>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("lib/assets/kota-depok-login.jpg"),
            ),
            accountName: Text("HELO"),
            accountEmail: Text("TEST"),
          ),
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
            leading: Icon(Icons.restaurant),
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
          ListTile(
            leading: Icon(Icons.menu_book),
            title: const Text("Perpustakaan"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BooksPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Logout"),
            onTap: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MyHomePage(title: 'Flutter Demo Home Page')),
              );
              final response = await request
                  // .logout('https://web-production-1710.up.railway.app/logout/');
                  .logout('http://localhost:8000/logout-flutter/');

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: const [
                      Icon(Icons.info_outline_rounded,
                          size: 30, color: Colors.white),
                      Spacer(
                        flex: 1,
                      ),
                      Text("Logout successful",
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
