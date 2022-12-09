import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:depoksmartcity/model/perpustakaan/bookDetails.dart';
import 'package:flutter/material.dart';
import 'package:depoksmartcity/main.dart';
import 'package:depoksmartcity/drawer/drawer.dart';
import 'package:depoksmartcity/page/detailMywatchlist.dart';
import 'package:depoksmartcity/model/fetch.dart';

class MywatchlistPage extends StatefulWidget {
  const MywatchlistPage(
      {Key? key, required this.listBudget, required this.addBudget})
      : super(key: key);
  final List<Budget> listBudget;
  final Function(Budget) addBudget;

  @override
  _MywatchlistPageState createState() => _MywatchlistPageState();
}

class _MywatchlistPageState extends State<MywatchlistPage> {
  Future<List<Mywatchlist>> fetchMywatchlist() async {
    var url =
        Uri.parse('http://tugas2pbpkiram.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Mywatchlist
    List<Mywatchlist> listMywatchlist = [];
    for (var datum in data) {
      if (datum != null) {
        listMywatchlist.add(Mywatchlist.fromJson(datum));
      }
    }

    return listMywatchlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Watch List'),
        ),

        // Menambahkan drawer menu
        drawer: MyDrawer(
          listBudget: widget.listBudget,
          addBudget: widget.addBudget,
        ),
        body: FutureBuilder(
            future: fetchMywatchlist(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "No Data Yet",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => MoviePage(
                                listBudget: widget.listBudget,
                                addBudget: widget.addBudget,
                                watched: snapshot.data![index].fields.watched,
                                title: snapshot.data![index].fields.title,
                                rating: snapshot.data![index].fields.rating,
                                releaseDate: snapshot.data![index].fields.releaseDate,
                                review: snapshot.data![index].fields.review,

                              ))
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )));
                }
              }
            }));
  }
}