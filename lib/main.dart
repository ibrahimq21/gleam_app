import 'package:gleam_app/service/service_api.dart';
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
          title: Text('Gleam App'),
        ),
        body: SurahLists(
          context,
          surah: ServiceAPi.fetchSurahNamesList(),
        ),
      ),
    );
  }
}
