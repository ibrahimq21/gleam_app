import 'package:gleam_app/model/surah.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ServiceAPi {


  static int LENGTH;


  /*static Future<int> fetchLength() async{
    try {
      final res = await http.get('http://api.alquran.cloud/v1/surah');

      if(res.statusCode == 200){


        final jsonRes = json.decode(res.body);

        LENGTH = SurahList.fromJson(jsonRes).surahs.length;







        return null;

      }else{
        return null;
      }

    } catch (ex) {
      print(ex.toString());

      return null;
    }

  }*/
  static Future<SurahList> fetchSurahNamesList() async {
    try {
      final res = await http.get('http://api.alquran.cloud/v1/surah');

      if(res.statusCode == 200){


        final jsonRes = json.decode(res.body);

        SurahList surahList = SurahList.fromJson(jsonRes);



        LENGTH = surahList.surahs.length;



        return surahList;
      }else{
        return null;
      }

    } catch (ex) {
      print(ex.toString());

      return null;
    }
  }

  static Future<Root> fetchSurahNames() async {
    print("fetchSurahNames: called");

    try {
      final response =
          await http.get('http://api.alquran.cloud/v1/surah/1/en.asad');

      if (response.statusCode == 200) {
//        print(json.decode(response.body));

        return Root.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (ex) {
      print(ex.toString());
      return null;
    }
  }
}
