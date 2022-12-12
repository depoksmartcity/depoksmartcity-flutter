import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:depoksmartcity/model/perpustakaan/bookHistory.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';



Future<List<BookHistory>> fetchBookHistoryActive(int pkBook, BuildContext context) async {
  List<BookHistory> listBookHistory = [];
  final request = context.watch<CookieRequest>();
  // var url = Uri.parse(
  //     'https://web-production-1710.up.railway.app/perpustakaan/book/history/active/$pkBook');
  final response = await request.get('https://web-production-1710.up.railway.app/perpustakaan/book/history/active/$pkBook');
  try{
    for (var datum in response) {
      if (datum != null) {
      listBookHistory.add(BookHistory.fromJson(datum));
      }
    }
    return listBookHistory;
  }
  catch (error){
    print(error);
    return listBookHistory;
  }
}

Future<List<BookHistory>> fetchBookHistoryDone(int pkBook, BuildContext context) async {
    List<BookHistory> listBookHistory = [];
  final request = context.watch<CookieRequest>();
  // var url = Uri.parse(
  //     'https://web-production-1710.up.railway.app/perpustakaan/book/history/active/$pkBook');
  final response = await request.get('https://web-production-1710.up.railway.app/perpustakaan/book/history/done/$pkBook');
  try{
    for (var datum in response) {
      if (datum != null) {
      listBookHistory.add(BookHistory.fromJson(datum));
      }
    }
    return listBookHistory;
  }
  catch (error){
    print(error);
    return listBookHistory;
  }
}