import 'dart:async';
import 'package:gleam_app/service_api.dart';
import 'package:gleam_app/surah.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'surah_list.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(IslamApp());
}

class IslamApp extends StatelessWidget {
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
          context,
          surah: ServiceAPi.fetchSurahNames(),
        ),
      ),
    );
  }
}
