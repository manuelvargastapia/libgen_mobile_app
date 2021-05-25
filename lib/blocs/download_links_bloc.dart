import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:libgen/data/download_links_repository.dart';
import 'package:libgen/blocs/events/download_links_events.dart';
import 'package:libgen/blocs/states/download_links_states.dart';
import 'package:libgen/domain/download_link_model.dart';

class DownloadLinksBloc extends Bloc<DownloadLinksEvent, DownloadLinksState> {
  final DownloadLinksRepository downloadLinksRepository;

  DownloadLinksBloc({@required this.downloadLinksRepository})
      : super(DownloadLinksInitialState());

  @override
  Stream<DownloadLinksState> mapEventToState(DownloadLinksEvent event) async* {
    if (event is DownloadLinksFetchEvent) {
      yield DownloadLinksLoadingState();
      final response = await downloadLinksRepository.getDownloadLinks(
        downloadPageURL: event.downloadPageURL,
        md5: event.md5,
      );
      if (response is http.Response) {
        if (response.statusCode == 200) {
          final rawResponse = jsonDecode(response.body);
          final rawLinks = rawResponse['data'] as List;
          final List<DownloadLinkModel> links = [];
          rawLinks.forEach((link) {
            links.add(DownloadLinkModel.fromJson(link));
          });
          yield DownloadLinksSuccessState(links: links);
        } else {
          yield DownloadLinksErrorState();
        }
      } else if (response is SocketException) {
        yield DownloadLinksConnectionFailed();
      } else {
        yield DownloadLinksErrorState();
      }
    }
  }
}
