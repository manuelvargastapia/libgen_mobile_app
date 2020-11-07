import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookRepository {
  static final BookRepository _bookRepository = BookRepository._();
  static const int _perPage = 10;

  BookRepository._();

  factory BookRepository() {
    return _bookRepository;
  }

  Future<dynamic> getBooks({
    @required String searchQuery,
    @required int offset,
  }) async {
    try {
      //return await http.get(
      // 'https://polar-temple-33235.herokuapp.com/search?searchQuery=$searchQuery&offset=$offset&count=$_perPage');
      return await http.get(
          'http://10.0.2.2:8000/search?searchQuery=$searchQuery&offset=$offset&count=$_perPage');
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> getDownloadLink({@required String md5}) async {
    try {
      // return await http
      //     .get('https://polar-temple-33235.herokuapp.com/download?md5=$md5');
      return await http.get('http://10.0.2.2:8000/download?md5=$md5');
    } catch (e) {
      return e.toString();
    }
  }
}
