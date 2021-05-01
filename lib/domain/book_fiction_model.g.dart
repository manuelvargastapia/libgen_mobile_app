// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_fiction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookFictionModel _$BookFictionModelFromJson(Map<String, dynamic> json) {
  return BookFictionModel(
    id: json['id'] as int,
    title: json['title'] as String,
    author: json['author'] as String,
    year: json['year'] as int,
    coverUrl: json['coverUrl'] as String,
    series: json['series'] as String,
    publisher: json['publisher'] as String,
    language: json['language'] as String,
    isbn: json['isbn'] as String,
    fileSize: json['fileSize'] as String,
    fileExtension: json['fileExtension'] as String,
    description: json['description'] as String,
  )..downloadPageURL = json['downloadPageURL'] as String;
}

Map<String, dynamic> _$BookFictionModelToJson(BookFictionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'year': instance.year,
      'downloadPageURL': instance.downloadPageURL,
      'coverUrl': instance.coverUrl,
      'series': instance.series,
      'publisher': instance.publisher,
      'language': instance.language,
      'isbn': instance.isbn,
      'fileSize': instance.fileSize,
      'fileExtension': instance.fileExtension,
      'description': instance.description,
    };
