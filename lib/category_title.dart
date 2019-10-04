import 'package:flutter/material.dart';

const _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight);

class CategoryTitle extends StatelessWidget{














  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(

      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: Colors.blueGrey,
          splashColor: Colors.greenAccent,

//          onTap: null,
          child: Padding(
              padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    'Name',
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),

          ),
        ),
      ),


    );
  }


}