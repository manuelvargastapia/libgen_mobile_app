import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:libgen/app.dart';

import 'src/domain/suggestion.dart';

void main() async {
  await FlutterDownloader.initialize(debug: true);
  await Hive.initFlutter();
  Hive.registerAdapter(SuggestionAdapter());

  runApp(LibGenApp());
}
