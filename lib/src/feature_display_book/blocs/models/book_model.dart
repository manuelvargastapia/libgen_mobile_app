import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  int id;
  String title;
  String author;
  int year;
  String md5;
  //String coverUrl;

  BookModel(
      {@required this.id,
      @required this.title,
      @required this.author,
      @required this.year,
      @required this.md5,
      //@required this.coverUrl
      });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}
