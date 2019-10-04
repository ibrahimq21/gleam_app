import 'package:http/http.dart' as http;
import 'dart:async';
import 'surah.dart';
import 'dart:convert';
class QuranApi{


  Future<Surah> _fetchSurahNames() async{

    final response = await http.get('http://api.alquran.cloud/v1/surah');


    if(response.statusCode == 200){

      return Surah.fromJson(json.decode(response.body));

    }


  }

}