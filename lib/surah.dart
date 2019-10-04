import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Surah {
  final int number;
  final name;
  final String englishName;
  final String englishNameTranslation;
  final int numberOfAyah;
  final String revelationType;

  const Surah({
    Key key,
    @required this.number,
    @required this.name,
    @required this.englishName,
    @required this.englishNameTranslation,
    @required this.numberOfAyah,
    @required this.revelationType,
  })  : assert(number != null),
        assert(name != null),
        assert(englishName != null),
        assert(englishNameTranslation != null),
        assert(numberOfAyah != null),
        assert(revelationType != null);

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
