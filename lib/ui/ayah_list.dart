import 'package:flutter/material.dart';
import 'dart:async';
import 'package:gleam_app/model/surah.dart';
import 'package:gleam_app/service/service_api.dart';
import 'package:quiver/core.dart';

class AyahList extends StatefulWidget {
  final Future<RootAyah> surah;
  final BuildContext context;

  @override
  _AyahListState createState() => _AyahListState(this.surah);

  AyahList(this.context, {Key key, this.surah}) : super(key: key);
}

class _AyahListState extends State<AyahList> {
  Future<RootAyah> surah;

  _AyahListState(this.surah);

  int length;

  Future<String> _calc() async {
    setState(() {
      length = ServiceAPI.LENGTH;
    });

    return length.toString();
  }

  Widget _buildCategoryWidgets() {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: RaisedButton(
              child: Center(
                child: FutureBuilder<RootAyah>(
                  future: surah,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      length = snapshot.data.surah.ayahs.length;
                      return Text('${snapshot.data.surah.ayahs[index].text}');
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          height: 50,
          color: Colors.blue,
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    _calc();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surah Ayat'),
      ),
      body: _buildCategoryWidgets(),
    );
  }
}
