class Root {
  int code;

  String status;

  Surah surah;

  Root({this.code, this.status, this.surah});

  factory Root.fromJson(Map<String, dynamic> json) {
    return Root(
      code: json['code'] as int,
      status: json['status'] as String,
      surah: Surah.fromJson(json['data']),
    );
  }
}

class RootAyah {
  int code;

  String status;

  AyahsListModel surah;

  RootAyah({this.code, this.status, this.surah});

  factory RootAyah.fromJson(Map<String, dynamic> json) {
    return RootAyah(
      code: json['code'] as int,
      status: json['status'] as String,
      surah: AyahsListModel.fromJson(json['data']),
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
    this.revelationType,
    this.numberOfAyah,
  });
  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json['number'] as int,
      name: json['name'] as String,
      englishName: json['englishName'] as String,
      englishNameTranslation: json['englishNameTranslation'] as String,
      numberOfAyah: json['numberOfAyah'] as int,
      revelationType: json['revelationType'] as String,
    );
  }
}

class SurahList {
  int code;
  String status;

  List<Surah> surahs;

  SurahList({this.code, this.status, this.surahs});

  factory SurahList.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;

    List<Surah> surahList = list.map((i) => Surah.fromJson(i)).toList();

    return new SurahList(
      code: json['code'] as int,
      status: json['status'] as String,
      surahs: surahList,
    );
  }
}

class AyahsListModel{
  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  int numberOfAyah;
  String revelationType;
  List<Ayahs> ayahs;

  AyahsListModel({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.numberOfAyah,
    this.ayahs
  });

  factory AyahsListModel.fromJson(Map<String, dynamic> json) {

    var list = json['ayahs'] as List;

    List<Ayahs> ayahsList = list.map((i) => Ayahs.fromJson(i)).toList();




    return AyahsListModel(
      number: json['number'] as int,
      name: json['name'] as String,
      englishName: json['englishName'] as String,
      englishNameTranslation: json['englishNameTranslation'] as String,
      numberOfAyah: json['numberOfAyah'] as int,
      revelationType: json['revelationType'] as String,
      ayahs: ayahsList,

    );
  }
}



class Ayahs {
  int number;
  String text;
  int numberinsurah;
  int juz;
  int manzil;
  int page;
  int rukuh;
  int hibzQuarter;
  bool sajda;

  Ayahs({this.number, this.text, this.numberinsurah, this.juz,
    this.manzil, this.page, this.rukuh, this.hibzQuarter, this.sajda}
    );


  factory Ayahs.fromJson(Map<String, dynamic> json){
    return Ayahs(
      number: json['number'] as int,
      text: json['text'] as String,
      numberinsurah: json['numberInSurah'] as int,
      juz: json['juz'] as int,
      manzil: json['manzil'] as int,
      page: json['page'] as int,
      rukuh: json['ruku'] as int,
      hibzQuarter: json['hizbQuarter'] as int,
      sajda: json['sajda'] as bool,
    );
  }

}
