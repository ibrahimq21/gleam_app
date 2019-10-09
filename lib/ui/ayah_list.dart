import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'package:gleam_app/model/surah.dart';

class AyahList extends StatefulWidget {
  final Future<RootAyah> surah;
  final BuildContext context;
  final int index;

  @override
  _AyahListState createState() => _AyahListState(this.surah, this.index);

  AyahList(this.context, this.index, {Key key, this.surah}) : super(key: key);
}

class _AyahListState extends State<AyahList> {
  Future<RootAyah> surah;
  int index;
  _AyahListState(this.surah, this.index);

  int audio;

  String playBtnUrl = 'assets/media/001_play_button.svg';

  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);

  play() async {
    int result = await audioPlayer.play(getUrl(index));
    if (result == 1) {
    } else {
      audioPlayer.dispose();
    }
  }

  changePhoto(String url) {
    setState(() {
      playBtnUrl = url;
    });
  }

  String getUrl(int indexs) {
    indexs++;
    String url =
        'https://verse.mp3quran.net/data/Yasser_Ad-Dussary_128kbps/00' +
            indexs.toString() +
            '003.mp3';

    return url;
  }

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
              onPressed: () {
                setState(() async {
                  if (playBtnUrl != 'assets/media/002_pause.svg') {
                    changePhoto('assets/media/002_pause.svg');
                    if (audio == 1) {
                      audio = await audioPlayer.resume();
                    } else if (audio != 1 && audio == null) {
                      audioPlayer.play(getUrl(index));
                    }
                  } else {
                    changePhoto('assets/media/001_play_button.svg');
                    audio = await audioPlayer.pause();
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
            child: _mainProjectWidget(),
          ),
        ],
      ),
    );
  }
}
