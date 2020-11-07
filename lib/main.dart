import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:libgen/app.dart';

void main() async {
  // Unique initialization required (see docs: https://pub.dev/packages/flutter_downloader)
  await FlutterDownloader.initialize(debug: true);

  runApp(LibGenApp());
}
