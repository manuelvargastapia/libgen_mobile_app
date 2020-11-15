// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) {
  return BookModel(
    id: json['id'] as int,
    title: json['title'] as String,
    author: json['author'] as String,
    md5: json['md5'] as String,
    fileExtension: json['fileExtension'] as String,
  );
}

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'md5': instance.md5,
      'fileExtension': instance.fileExtension,
    };
