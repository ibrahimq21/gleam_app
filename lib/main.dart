import 'package:gleam_app/service/service_api.dart';
import 'package:gleam_app/ui/surah_list.dart';
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
      title: 'Gleam App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gleam App'),
        ),
        body: SurahLists(
          context,
          surah: ServiceAPI.fetchSurahNamesList(),
        ),
      ),
    );
  }
}
