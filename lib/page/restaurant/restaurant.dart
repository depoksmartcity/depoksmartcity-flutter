import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:depoksmartcity/model/restaurant/fetch_restaurant.dart';
import 'package:depoksmartcity/page/restaurant/detail_restaurant.dart';



class RestaurantPage extends StatefulWidget {
    const RestaurantPage({Key? key}) : super(key: key);

    @override
    _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {

    Widget build(BuildContext context){
      return Scaffold(
    appBar: AppBar(
        title: const Text('Restaurant'),
    ),
    drawer: const DrawerClass(),
    body: FutureBuilder(
        future: fetchRestaurant(),
        builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
            } 
            else {
            if (!snapshot.hasData) {
                return Column(
                children: const [
                    Text(
                    "Tidak ada restoran",
                    style: TextStyle(
                        color: Color(0xff59A5D8),
                        fontSize: 20),
                    ),
                    SizedBox(height: 8),
                ],
                );
            } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index)=>InkWell(
                      onTap: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailRestaurantPage(data :snapshot.data![index])));
                      },
                    child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color:Colors.white,
                        border: Border.all(
                          width: 1.0,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(7.0),
                        boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 0.5
                        )
                        ]
                    ),
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
                        // Text(snapshot.data![index].fields.watched ? "watched" : ""),
                        ],
                    ),
                    )
                    )
                );
            }
            }
        }
    )
);
    }
}