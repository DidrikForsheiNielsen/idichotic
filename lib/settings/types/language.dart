import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

@JsonSerializable()
class Language {
  const Language({
    this.iso_639_1,
    required this.iso_639_2,
    required this.english,
    required this.french,
    this.german
  });

  final String? iso_639_1;
  final String iso_639_2;

  final String english;
  final String french;
  final String? german;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}

// Stores languages as strings in the database
class LanguageConverter extends TypeConverter<Language, String> {
  const LanguageConverter();

  @override
  Language fromSql(String fromDb) {
    return Language.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Language value) {
    return json.encode(value.toJson());
  }
}