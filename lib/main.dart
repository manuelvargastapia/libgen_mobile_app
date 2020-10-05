import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'src/app.dart';

void main() async {
  // Unique initialization required
  await FlutterDownloader.initialize(debug: true);

  runApp(LibGen());
}
