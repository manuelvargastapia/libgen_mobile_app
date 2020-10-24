import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:libgen/app.dart';

void main() async {
  // Unique initialization required
  await FlutterDownloader.initialize(debug: true);

  //Bloc.observer = BookBlocObserver();

  runApp(LibGenApp());
}
