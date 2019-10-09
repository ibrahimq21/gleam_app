import 'package:flutter/material.dart';
import 'package:gleam_app/model/surah.dart';
import 'package:gleam_app/service/service_api.dart';

import 'ayah_list.dart';

class SurahLists extends StatefulWidget {
  List<String> entries;

  final Future<SurahList> surah;
  final BuildContext context;

  List<int> colorCode;
  SurahLists(this.context, {Key key, this.surah}) : super(key: key);

  @override
  _SurahListState createState() => _SurahListState(this.surah, this.context);
}

class _SurahListState extends State<SurahLists> {
  BuildContext context;
  Future<SurahList> surah;
  int len;

  _SurahListState(this.surah, this.context);

  Widget _buildCategoryWidgets() {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: 114,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: RaisedButton(
              child: Center(
                child: FutureBuilder<SurahList>(
                  future: surah,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text('${snapshot.data.surahs[index].name}');
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return CircularProgressIndicator();
                  },
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AyahList(
                      context,
                      index,
                      surah: ServiceAPI.fetchListOfAyah(index),
                    ),
                  ),
                );
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
    assert(debugCheckHasMediaQuery(context));
    // TODO: implement build
    return _buildCategoryWidgets();
  }
}
