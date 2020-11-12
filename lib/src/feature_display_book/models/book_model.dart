import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  int id;
  String title;
  String author;
  String md5;
  String coverUrl;
  String fileExtension;

  BookModel({
    @required this.id,
    @required this.title,
    @required this.author,
    @required this.md5,
    @required this.coverUrl,
    @required this.fileExtension,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}
