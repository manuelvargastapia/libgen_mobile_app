import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:libgen/src/feature_display_book/bloc/book_event.dart';
import 'package:libgen/src/feature_display_book/bloc/book_state.dart';
import 'package:libgen/src/feature_display_book/models/book_model.dart';
import 'package:libgen/src/feature_display_book/models/download_link_model.dart';
import 'package:libgen/src/feature_display_book/repository/book_repository.dart';

import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;
  bool isFetching = false;
  bool isDownloading = false;

  BookBloc({@required this.bookRepository}) : super(BookInitialState());

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    if (event is BookFetchEvent) {
      yield BookLoadingState(message: 'Loading books');
      final response = await bookRepository.getBooks(event.searchQuery);
      if (response is http.Response) {
        if (response.statusCode == 200) {
          final rawBooks = jsonDecode(response.body)['data'] as List;
          final List<BookModel> books = [];
          rawBooks.forEach((book) {
            books.add(BookModel.fromJson(book));
          });
          yield BookSuccessState(books: books);
        } else {
          yield BookErrorState(error: response.body);
        }
      } else if (response is String) {
        yield BookErrorState(error: response);
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
