import 'package:flutter/material.dart';
import 'category_title.dart';

class SurahList extends StatefulWidget {
  List<String> entries;

  List<int> colorCode;
  SurahList(this.entries, this.colorCode);

  @override
  _SurahListState createState() => _SurahListState(entries, colorCode);
}

class _SurahListState extends State<SurahList> {
  final _surahList = <String>[];

  static const _surahNames = <String>[
    'Al-Faatiha',
    'Al-Baqara',
    'Aal-i-Imraan',
    'An-Nisaa',
    'Al-Maaida',
    'Al-An\' aam',
    'Al-A\'raaf',
    'Al-Anfaal',
  ];
  List<String> entries;

  List<int> colorCode;

  _SurahListState(this.entries, this.colorCode);

  Widget _buildCategoryWidgets() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCode[index]],
            child: Center(
                child: Text(
                    '${_surahNames[index]}'
                )
            ),
          );
        });
    /*else {
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3.0,
        children: _categories.map((Category c) {
          return CategoryTitle(

          );
        }).toList(),
      );*/
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    // TODO: implement build
    return _buildCategoryWidgets();
  }
}
