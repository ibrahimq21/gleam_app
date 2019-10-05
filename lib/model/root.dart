
import 'package:gleam_app/model/surah.dart';

class Root{

  int code;

  String status;

  Surah data;

  Root({this.code, this.status, this.data});



  factory Root.fromJson(Map<String, dynamic> json){
    return Root(
      code: json['code'],
      status: json['status'],
      data: Surah.fromJson(json['data'])
    );
  }










}