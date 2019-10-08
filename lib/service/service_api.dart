import 'package:gleam_app/model/surah.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Ret {
  static int len;
}

class ServiceAPI {
  static Future<RootAyah> fetchListOfAyah(int surah) async {
    surah++;
    try {
      final res = await http.get(
          'http://api.alquran.cloud/v1/surah/' + surah.toString() + '/en.asad');

      if (res.statusCode == 200) {
        final jsonRes = json.decode(res.body);

        RootAyah ayats = RootAyah.fromJson(jsonRes);

        int len = ayats.surah.numberOfAyah;

        Ret.len = len;

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
