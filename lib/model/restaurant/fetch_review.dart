import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:depoksmartcity/model/restaurant/restaurant.dart';
import 'package:depoksmartcity/model/restaurant/review.dart';


Future<List<Review>> fetchReview() async {
        var url = Uri.parse('https://web-production-1710.up.railway.app/restaurants/json/');
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
        List<Review> restaurant = [];
        for (var d in data) {
        if (d != null) {
            restaurant.add(Review.fromJson(d));
        }
        }

        return restaurant;
    }