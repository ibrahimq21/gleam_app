import 'package:http/http.dart' as http;
import 'dart:async';
import 'Urls.dart';
import 'surah.dart';
import 'dart:convert';

class ServiceAPi {
  static Future<Surah> fetchSurahNames() async {
    print("fetchSurahNames: called");

    try {
      final response = await http.get('http://api.alquran.cloud/v1/surah');

      if (response.statusCode == 200) {
        print("fetchSurahNames: called : got a responce "+json.decode(response.body));


        return Surah.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (ex) {
      print(ex.toString());
    }
  }
}
