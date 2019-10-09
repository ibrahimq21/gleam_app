import 'package:gleam_app/model/surah.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Ret {
  static int len;
}

class ServiceAPI {
  static var response;

  static Future<RootAyah> fetchLink(int surahNumber) async {
    surahNumber++;
    response = await http.get('http://api.alquran.cloud/v1/surah/' +
        surahNumber.toString() +
        '/en.asad');

    RootAyah ayats = RootAyah.fromJson(response);
    return ayats;
  }

  static Future<RootAyah> fetchListOfAyah(int surahNumber) async {
    surahNumber++;
    try {
      final res = await http.get('http://api.alquran.cloud/v1/surah/' +
          surahNumber.toString() +
          '/en.asad');

      if (res.statusCode == 200) {
        final jsonRes = json.decode(res.body);

        RootAyah ayats = RootAyah.fromJson(jsonRes);



        return ayats;
      } else {
        return null;
      }
    } catch (ex) {
      print(ex.toString());
      return null;
    }
  }

  static Future<SurahList> fetchSurahNamesList() async {
    try {
      final res = await http.get('http://api.alquran.cloud/v1/surah');

      if (res.statusCode == 200) {
        final jsonRes = json.decode(res.body);

        SurahList surahList = SurahList.fromJson(jsonRes);

        return surahList;
      } else {
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
