import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details_model.g.dart';

@JsonSerializable()
class DetailsModel {
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

  DetailsModel({
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
  });

  String toString() =>
      "BookDetails: ${this.id.toString()},${this.title.toString()},${this.author.toString()},${this.year.toString()},${this.md5.toString()},${this.coverUrl.toString()},${this.volumeInfo.toString()},${this.series.toString()},${this.edition.toString()},${this.publisher.toString()},${this.city.toString()},${this.pages.toString()},${this.language.toString()},${this.isbn.toString()},${this.doi.toString()},${this.fileSize.toString()},${this.fileExtension.toString()},${this.description.toString()},${this.contents.toString()}";

  factory DetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DetailsModelFromJson(json);
}
