import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:libgen/bloc_observer.dart';

import 'app.dart';
import 'domain/suggestion.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);
  await Hive.initFlutter();
  Hive.registerAdapter(SuggestionAdapter());

  Bloc.observer = GlobalBlocObserver();

  runApp(LibGenApp());
}
