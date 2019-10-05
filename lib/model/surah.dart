class Root {
  int code;

  String status;

  Surah data;

  Root({this.code, this.status, this.data});

  factory Root.fromJson(Map<String, dynamic> json) {
    return Root(
        code: json['code'],
        status: json['status'],
        data: Surah.fromJson(json['data']),
    );
  }
}

class Surah {

  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  int numberOfAyah;
  String revelationType;

  Surah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyah,
    this.revelationType,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {




    return Surah(
      number: json['number'] as int,
      name: json['name'] as String,
      englishName: json['englishName'] as String,
      englishNameTranslation: json['englishNameTranslation'] as String,
      numberOfAyah: json['numberOfAyah'] as int,
      revelationType: json['revelationType']as String,
    );
  }




}

class SurahList{

  int code;
  String status;

  List<Surah> surahs;

  SurahList({this.code, this.status, this.surahs});

  factory SurahList.fromJson(Map<String, dynamic> json){

    var list = json['data'] as List;
    
    List<Surah> surahList = list.map((i) => Surah.fromJson(i)).toList();

    return new SurahList(
      code: json['code'] as int,
      status: json['status'] as String,
      surahs: surahList,
    );
  }

}


class Ayahs{




}