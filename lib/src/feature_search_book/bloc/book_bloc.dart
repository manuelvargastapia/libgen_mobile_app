import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:libgen/src/feature_search_book/bloc/book_event.dart';
import 'package:libgen/src/feature_search_book/bloc/book_state.dart';
import 'package:libgen/src/feature_search_book/models/book_model.dart';
import 'package:libgen/src/feature_search_book/models/download_link_model.dart';
import 'package:libgen/src/feature_search_book/repository/book_repository.dart';

import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;
  bool isFetching = false;
  bool isDownloading = false;
  int _totalCount = 0;

  BookBloc({@required this.bookRepository}) : super(BookInitialState());

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    if (event is BookFetchEvent) {
      yield BookLoadingState(
        requiresCleaning: event.searchQuery.offset == 0,
      );
      if (event.searchQuery.offset > 0 &&
          event.searchQuery.offset >= _totalCount) {
        yield BookNoMoreResults(message: "No more results!");
      } else {
        final response = await bookRepository.getBooks(event.searchQuery);
        if (response is http.Response) {
          if (response.statusCode == 200) {
            final rawResponse = jsonDecode(response.body);
            final rawBooks = rawResponse['data'] as List;
            _totalCount = rawResponse['totalCount'] as int;
            if (rawBooks.isNotEmpty) {
              final List<BookModel> books = [];
              rawBooks.forEach((book) {
                books.add(BookModel.fromJson(book));
              });
              yield BookSuccessState(books: books, totalCount: _totalCount);
            } else {
              yield BookNoResultsState(
                message: 'No results for "${event.searchQuery.searchTerm}"',
              );
            }
          } else {
            yield BookErrorState(error: response.body);
          }
        } else if (response is String) {
          yield BookErrorState(error: response);
        }
      }
    } else if (event is DownloadBookEvent) {
      yield DownloadInProgress(message: 'Downloading book');
      final response = await bookRepository.getDownloadLink(event.md5);
      if (response is http.Response) {
        if (response.statusCode == 200) {
          final String downloadLink =
              DownloadLinkModel.fromJson(jsonDecode(response.body)['data'])
                  .downloadLink;
          yield DownloadSuccessful(message: downloadLink);
          await Permission.storage.request();
          Directory downloadsDirectory =
              await DownloadsPathProvider.downloadsDirectory;
          WidgetsFlutterBinding.ensureInitialized();
          if (await Permission.storage.isGranted) {
            await FlutterDownloader.enqueue(
              url: downloadLink,
              savedDir: downloadsDirectory.path,
              showNotification: true,
              openFileFromNotification: true,
            );
          }
        } else {
          yield DownloadError(error: response.body);
        }
      } else if (response is String) {
        yield DownloadError(error: response);
      }
    }
  }
}
