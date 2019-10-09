import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'package:gleam_app/model/surah.dart';

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

  String playBtnUrl = 'assets/media/001_play_button.svg';

  Widget _audioUI() {
    return Container(
      height: 80,
      width: double.infinity,
      color: Colors.blueGrey,
      padding: EdgeInsets.all(16.6),
      child: Row(
//        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[
          Expanded(

            child: FloatingActionButton(

              onPressed: (){
                setState(() {
                  if(playBtnUrl != 'assets/media/002_pause.svg'){
                    playBtnUrl = 'assets/media/002_pause.svg';
                  }else{
                    playBtnUrl = 'assets/media/001_play_button.svg';
                  }
                });
              },
              child: SvgPicture.asset(playBtnUrl),
            ),
          ),


        ],
      ),
    );
  }

  Widget _mainProjectWidget() {
    return FutureBuilder<RootAyah>(
      future: surah,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          return CircularProgressIndicator();
        }

        return ListView.separated(
          itemCount: snapshot.data.surah.ayahs.length,
          itemBuilder: (context, int index) {
            return Container(
              height: 50,
              color: Colors.blue,
              child: RaisedButton(
                  child: Center(
                    child: Text('${snapshot.data.surah.ayahs[index].text}'),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: const Text('Surah Ayat'),
      ),
      body: Column(
        children: <Widget>[
          _audioUI(),
          Expanded(
              child:_mainProjectWidget(),
          ),

        ],
      ),
    );
  }
}
