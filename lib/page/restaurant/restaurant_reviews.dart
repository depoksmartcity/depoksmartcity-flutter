// import 'package:depoksmartcity/drawer/drawer.dart';
// import 'package:flutter/material.dart';
// import 'package:depoksmartcity/model/restaurant/restaurant.dart';
// import 'package:depoksmartcity/model/restaurant/review.dart';
// import 'package:depoksmartcity/model/restaurant/fetch_review.dart';



// class ReviewRestaurantPage extends StatefulWidget{

//   Restaurants data;
//   Review review;

//   ReviewRestaurantPage({super.key, required this.review });

//   @override
//   _ReviewRestaurantPageState createState() => _ReviewRestaurantPageState();
// }

// class _ReviewRestaurantPageState extends State<ReviewRestaurantPage>{

//     Widget build(BuildContext context){
//       return Scaffold(
//     appBar: AppBar(
//         title: const Text('Restaurant'),
//     ),
//     drawer: const DrawerClass(),
//     body: FutureBuilder(
//         future: fetchReview(),
//         builder: (context, AsyncSnapshot snapshot) {
//             if (snapshot.data == null) {
//             return const Center(child: CircularProgressIndicator());
//             } else {
//             if (!snapshot.hasData) {
//                 return Column(
//                 children: const [
//                     Text(
//                     "Belum ada ulasan",
//                     style: TextStyle(
//                         color: Color(0xff59A5D8),
//                         fontSize: 20),
//                     ),
//                     SizedBox(height: 8),
//                 ],
//                 );
//             } else {
//                 return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (_, index)=>InkWell(
//                       child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
//                     padding: const EdgeInsets.all(10.0),
//                     decoration: BoxDecoration(
//                         color:Colors.white,
//                         border: Border.all(
//                           width: 1.0,
//                           color: Colors.blue,
//                         ),
//                         borderRadius: BorderRadius.circular(7.0),
//                         boxShadow: const [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 0.5
//                         )
//                         ]
//                     ),
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                         Text(
//                             "${snapshot.data![index].fields.name}",
//                             style: const TextStyle(
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.bold,
//                             ),
//                         ),
//                         const SizedBox(height: 10),
//                         // Text(snapshot.data![index].fields.watched ? "watched" : ""),
//                         ],
//                     ),
//                     )
//                     )
//                 );
//             }
//             }
//         }
//     )
// );
//     }
// }