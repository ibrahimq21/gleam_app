

class Surah {
  final String number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String numberOfAyah;
  final String revelationType;

  const Surah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyah,
    this.revelationType,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      englishNameTranslation: json['englishNameTranslation'],
      numberOfAyah: json['numberOfAyah'],
      revelationType: json['revelationType'],
    );
  }
}
