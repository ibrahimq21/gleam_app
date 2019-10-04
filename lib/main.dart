import 'dart:async';
import 'package:gleam_app/surah.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'surah_list.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(IslamApp());
}

class IslamApp extends StatelessWidget {
  Future<Surah> _fetchSurahNames() async {
    final response = await http.get('http://api.alquran.cloud/v1/surah');

    if (response.statusCode == 200) {
      return Surah.fromJson(json.decode(response.body));
    }else{
      throw Exception("Failed to Load api");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gelam App'),
        ),
        body: SurahList(
          surah: _fetchSurahNames(),
        ),
      ),
    );
  }
}

