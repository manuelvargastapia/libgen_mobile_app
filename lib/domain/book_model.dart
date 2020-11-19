import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  int id;
  String title;
  String author;
  int year;
  String md5;
  String coverUrl;
  String volumeInfo;
  String series;
  String edition;
  String publisher;
  String city;
  int pages;
  String language;
  String isbn;
  String doi;
  int fileSize;
  String fileExtension;
  String description;
  String contents;
  String downloadLink;

  BookModel({
    @required this.id,
    @required this.title,
    @required this.author,
    @required this.year,
    @required this.md5,
    @required this.coverUrl,
    @required this.volumeInfo,
    @required this.series,
    @required this.edition,
    @required this.publisher,
    @required this.city,
    @required this.pages,
    @required this.language,
    @required this.isbn,
    @required this.doi,
    @required this.fileSize,
    @required this.fileExtension,
    @required this.description,
    @required this.contents,
    @required this.downloadLink,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}
