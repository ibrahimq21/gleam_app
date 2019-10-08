import 'package:flutter/material.dart';
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



  Widget _mainProjectWidget(){

    return FutureBuilder<RootAyah>(
      future: surah,
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.none && snapshot.hasData == null){

          return CircularProgressIndicator();
        }

        return ListView.separated(


            itemCount: snapshot.data.surah.ayahs.length,
            itemBuilder: (context, int index){
              return Container(
                height: 50,
                color: Colors.blue,
                child: RaisedButton(
                  child: Center(
                    child: Text('${snapshot.data.surah.ayahs[index].text}'),

                  ),
                    onPressed: (){
                      Navigator.pop(context);
                    }
                ),
              );
            },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        );

      },

    );

  }


  int length = 1;


  RootAyah ayahList = new RootAyah();

  

  Widget _buildCategoryWidgets() {
    return ListView.separated(

      padding: const EdgeInsets.all(8),


      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: RaisedButton(
              child: Center(
                child: FutureBuilder<RootAyah>(
                  future: surah,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListTile(
                        title: Text('${snapshot.data.surah.ayahs[index].text}'),
                      );

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Surah Ayat'),
      ),
      body: _mainProjectWidget(),
    );
  }
}
