import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:libgen/domain/book_model.dart';
import 'package:libgen/domain/download_link_model.dart';
import 'package:libgen/data/book_repository.dart';
import 'events/book_events.dart';
import 'states/book_states.dart';

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
            yield BookErrorState(
              error: "Ups! We messed up. Try again later, please",
            );
          }
        } else if (response is String) {
          yield BookErrorState(
            error: "Ups! We messed up. Try again later, please",
          );
        }
      }
    } else if (event is DownloadBookEvent) {
      yield DownloadStarting();
      final response = await bookRepository.getDownloadLink(event.md5);
      if (response is http.Response) {
        if (response.statusCode == 200) {
          final String downloadLink =
              DownloadLinkModel.fromJson(jsonDecode(response.body)['data'])
                  .downloadLink;
          await Permission.storage.request();
          Directory downloadsDirectory =
              await DownloadsPathProvider.downloadsDirectory;
          WidgetsFlutterBinding.ensureInitialized();
          if (await Permission.storage.isGranted) {
            yield DownloadInProgress(message: "Download in progress");
            await FlutterDownloader.enqueue(
              url: downloadLink,
              savedDir: downloadsDirectory.path,
              showNotification: true,
              openFileFromNotification: true,
            );
          }
        } else {
          yield DownloadError(error: "Download error. Try again later, please");
        }
      } else if (response is String) {
        yield DownloadError(error: "Download error. Try again later, please");
      }
    }
  }
}
