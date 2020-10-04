import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;

import '../models/result.dart';

class BookApiProvider {
  Client client = Client();

  Future<Result> fetchBookList(String query) async {
    final response = await client.get(
        "https://polar-temple-33235.herokuapp.com/search?searchQuery=${query}");
    print(response.statusCode);
    if (response.statusCode == 200) {
      return Result.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
