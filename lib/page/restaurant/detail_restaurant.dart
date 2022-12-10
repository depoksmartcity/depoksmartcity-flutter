import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:depoksmartcity/model/restaurant/restaurant.dart';


class DetailRestaurantPage extends StatefulWidget{

  Restaurants data;

  DetailRestaurantPage({super.key, required this.data });

  @override
  _DetailRestaurantPageState createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<DetailRestaurantPage>{

  

  Widget build(BuildContext context){
    return(
      Scaffold(
        appBar: AppBar(
          title: const Text("Detail"),
        ),
        drawer: const DrawerClass(),
        body: Container(
          margin: const EdgeInsets.all(8.0),
          height: MediaQuery.of(context).size.height,
          child: Column(
          children:  [
            Align(
              
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Image.network(
                widget.data.fields.img,
              ),
              )
            ),

            Align(
              
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                widget.data.fields.name,
                style: const TextStyle(
                  fontSize: 32.0
                ),
              ),
              )
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 4.0),
            child : Row(
              children: [
                const Text(
                  "Lokasi: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                ),
                const SizedBox(
                //Use of SizedBox
                width: 10,
                ),
                Text(
                  widget.data.fields.lokasi,
                  style: const TextStyle(fontSize: 16)
                )
              ],
            ),
            ),
            Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child:  Text(
                  "Deskripsi ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                ),
                ),
               
                const SizedBox(
                //Use of SizedBox
                height: 2,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                  widget.data.fields.desc,
                  style: const TextStyle(fontSize: 16)
                ),
                ),
              ],
            ),
            const Spacer(),
            TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all( Colors.blue),
              ),  
            onPressed:(){
              Navigator.pop(context);
            }, 
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Align(
                alignment: Alignment.center,
                child :  Text(
                  "Lihat Ulasan",
                  style: TextStyle(color : Colors.white)
                )
              )
            )),
            TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all( Colors.blue),
              ),  
            onPressed:(){
              Navigator.pop(context);
            }, 
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Align(
                alignment: Alignment.center,
                child :  Text(
                  "Kembali",
                  style: TextStyle(color : Colors.white)
                )
              )
            ))

          ],
        ),
        )

      )
    );
  }
}