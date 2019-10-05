import 'package:flutter/material.dart';
import 'package:gleam_app/surah.dart';

class SurahList extends StatefulWidget {
  List<String> entries;

  final Future<Surah> surah;
  final BuildContext context;

  List<int> colorCode;
  SurahList(this.context, {Key key, this.surah}) : super(key: key);

  @override
  _SurahListState createState() => _SurahListState(this.surah, this.context);
}

class _SurahListState extends State<SurahList> {
  BuildContext context;
  Future<Surah> surah;

  _SurahListState(this.surah, this.context);

  Widget _buildCategoryWidgets() {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.blue,
          child: Center(
            child: FutureBuilder<Surah>(
              future: surah,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.englishName.toString());
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
