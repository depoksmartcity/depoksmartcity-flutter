import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:depoksmartcity/model/restaurant/restaurant.dart';

Future<List<Restaurants>> fetchRestaurant() async {
        var url = Uri.parse('http://depoksmartcity.herokuapp.com/restaurants/json/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object WatchList
        List<Restaurants> restaurant = [];
        for (var d in data) {
        if (d != null) {
            restaurant.add(Restaurants.fromJson(d));
        }
        }

        return restaurant;
    }