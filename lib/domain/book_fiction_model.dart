import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:libgen/domain/i_book_model.dart';

part 'book_fiction_model.g.dart';

@JsonSerializable()
class BookFictionModel implements BookModel {
  int id;
  String title;
  String author;
  int year;
  String downloadPageURL;
  String coverUrl;
  String series;
  String publisher;
  String language;
  String isbn;
  String fileSize;
  String fileExtension;
  String description;

  BookFictionModel({
    @required this.id,
    @required this.title,
    @required this.author,
    @required this.year,
    @required this.coverUrl,
    @required this.series,
    @required this.publisher,
    @required this.language,
    @required this.isbn,
    @required this.fileSize,
    @required this.fileExtension,
    @required this.description,
  });

  factory BookFictionModel.fromJson(Map<String, dynamic> json) =>
      _$BookFictionModelFromJson(json);
}
