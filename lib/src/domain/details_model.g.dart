// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsModel _$DetailsModelFromJson(Map<String, dynamic> json) {
  return DetailsModel(
    id: json['id'] as int,
    title: json['title'] as String,
    author: json['author'] as String,
    year: json['year'] as int,
    md5: json['md5'] as String,
    coverUrl: json['coverUrl'] as String,
    volumeInfo: json['volumeInfo'] as String,
    series: json['series'] as String,
    edition: json['edition'] as String,
    publisher: json['publisher'] as String,
    city: json['city'] as String,
    pages: json['pages'] as int,
    language: json['language'] as String,
    isbn: json['isbn'] as String,
    doi: json['doi'] as String,
    fileSize: json['fileSize'] as int,
    fileExtension: json['fileExtension'] as String,
    description: json['description'] as String,
    contents: json['contents'] as String,
  );
}

Map<String, dynamic> _$DetailsModelToJson(DetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'year': instance.year,
      'md5': instance.md5,
      'coverUrl': instance.coverUrl,
      'volumeInfo': instance.volumeInfo,
      'series': instance.series,
      'edition': instance.edition,
      'publisher': instance.publisher,
      'city': instance.city,
      'pages': instance.pages,
      'language': instance.language,
      'isbn': instance.isbn,
      'doi': instance.doi,
      'fileSize': instance.fileSize,
      'fileExtension': instance.fileExtension,
      'description': instance.description,
      'contents': instance.contents,
    };
