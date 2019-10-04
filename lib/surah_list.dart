import 'package:flutter/material.dart';
import 'package:gleam_app/surah.dart';

class SurahList extends StatefulWidget {
  List<String> entries;

  final Future<Surah> surah;

  List<int> colorCode;
  SurahList({Key key, this.surah}) : super(key: key);

  @override
  _SurahListState createState() => _SurahListState(this.surah);
}

class _SurahListState extends State<SurahList> {
  Future<Surah> surah;

  _SurahListState(this.surah);

  Widget _buildCategoryWidgets() {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.blue,
          child: Center(
            child: FutureBuilder<Surah>(
              future: surah,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.englishName);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
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
