import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:flutter/material.dart';

class RequestKTPPage extends StatefulWidget {
  const RequestKTPPage({super.key});

  @override
  State<RequestKTPPage> createState() => _RequestKTPPageState();
}

class _RequestKTPPageState extends State<RequestKTPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request KTP'),
      ),
      drawer: const DrawerClass(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello World!'),
          ],
        ),
      ),
    );
  }
}
