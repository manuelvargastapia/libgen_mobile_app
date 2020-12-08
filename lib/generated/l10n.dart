// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Search by title, author or ISBN`
  String get searchBookScreenSearchBarHint {
    return Intl.message(
      'Search by title, author or ISBN',
      name: 'searchBookScreenSearchBarHint',
      desc: '',
      args: [],
    );
  }

  /// `Title, author or ISBN`
  String get searchBookDelegateSearchFieldLabel {
    return Intl.message(
      'Title, author or ISBN',
      name: 'searchBookDelegateSearchFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// ` results`
  String get resultsBuilderTotalResultsCounterMessage {
    return Intl.message(
      ' results',
      name: 'resultsBuilderTotalResultsCounterMessage',
      desc: '',
      args: [],
    );
  }

  /// `No more results!`
  String get resultsBuilderNoMoreResultsMessage {
    return Intl.message(
      'No more results!',
      name: 'resultsBuilderNoMoreResultsMessage',
      desc: '',
      args: [],
    );
  }

  /// `No results for "{searchTerm}"`
  String resultsBuilderNoResultsForSearchTermMessage(Object searchTerm) {
    return Intl.message(
      'No results for "$searchTerm"',
      name: 'resultsBuilderNoResultsForSearchTermMessage',
      desc: '',
      args: [searchTerm],
    );
  }

  /// `Ups! We messed it up.\nTry again later, please`
  String get resultsBuilderGenericErrorMessage {
    return Intl.message(
      'Ups! We messed it up.\nTry again later, please',
      name: 'resultsBuilderGenericErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get showFilterDialogTitle {
    return Intl.message(
      'Filter',
      name: 'showFilterDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get showFilterDialogCancel {
    return Intl.message(
      'Cancel',
      name: 'showFilterDialogCancel',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get showFilterDialogApply {
    return Intl.message(
      'Apply',
      name: 'showFilterDialogApply',
      desc: '',
      args: [],
    );
  }

  /// `Search in`
  String get showFilterDialogSearchInLabel {
    return Intl.message(
      'Search in',
      name: 'showFilterDialogSearchInLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sort by`
  String get showFilterDialogSortByLabel {
    return Intl.message(
      'Sort by',
      name: 'showFilterDialogSortByLabel',
      desc: '',
      args: [],
    );
  }

  /// `(no title)`
  String get bookDetailsPresenterNoTitle {
    return Intl.message(
      '(no title)',
      name: 'bookDetailsPresenterNoTitle',
      desc: '',
      args: [],
    );
  }

  /// `by {author}`
  String bookDetailsPresenterByAuthor(Object author) {
    return Intl.message(
      'by $author',
      name: 'bookDetailsPresenterByAuthor',
      desc: '',
      args: [author],
    );
  }

  /// `Info`
  String get bookDetailsPresenterInfo {
    return Intl.message(
      'Info',
      name: 'bookDetailsPresenterInfo',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get bookDetailsPresenterDescription {
    return Intl.message(
      'Description',
      name: 'bookDetailsPresenterDescription',
      desc: '',
      args: [],
    );
  }

  /// `Table of Contents`
  String get bookDetailsPresenterTOC {
    return Intl.message(
      'Table of Contents',
      name: 'bookDetailsPresenterTOC',
      desc: '',
      args: [],
    );
  }

  /// `Please, provide permissions app from app settings`
  String get downloadButtonProvidePermissions {
    return Intl.message(
      'Please, provide permissions app from app settings',
      name: 'downloadButtonProvidePermissions',
      desc: '',
      args: [],
    );
  }

  /// `The file is massive! Please, use the browser to download`
  String get downloadButtonDownloadFromBrowser {
    return Intl.message(
      'The file is massive! Please, use the browser to download',
      name: 'downloadButtonDownloadFromBrowser',
      desc: '',
      args: [],
    );
  }

  /// `TXT`
  String get downloadButtonDefaultExtension {
    return Intl.message(
      'TXT',
      name: 'downloadButtonDefaultExtension',
      desc: '',
      args: [],
    );
  }

  /// `Permissions denied`
  String get downloadButtonPermissionsDenied {
    return Intl.message(
      'Permissions denied',
      name: 'downloadButtonPermissionsDenied',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get downloadButtonCancel {
    return Intl.message(
      'Cancel',
      name: 'downloadButtonCancel',
      desc: '',
      args: [],
    );
  }

  /// `Open Settings`
  String get downloadButtonOpenSettings {
    return Intl.message(
      'Open Settings',
      name: 'downloadButtonOpenSettings',
      desc: '',
      args: [],
    );
  }

  /// `Large file`
  String get downloadButtonLargeFile {
    return Intl.message(
      'Large file',
      name: 'downloadButtonLargeFile',
      desc: '',
      args: [],
    );
  }

  /// `Open Browser`
  String get downloadButtonOpenBrowser {
    return Intl.message(
      'Open Browser',
      name: 'downloadButtonOpenBrowser',
      desc: '',
      args: [],
    );
  }

  /// `Starting download`
  String get downloadButtonStartingDownloadMessage {
    return Intl.message(
      'Starting download',
      name: 'downloadButtonStartingDownloadMessage',
      desc: '',
      args: [],
    );
  }

  /// `Download error. Try again later, please`
  String get downloadButtonGenericErrorMessage {
    return Intl.message(
      'Download error. Try again later, please',
      name: 'downloadButtonGenericErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Show more`
  String get expandableTextShowMore {
    return Intl.message(
      'Show more',
      name: 'expandableTextShowMore',
      desc: '',
      args: [],
    );
  }

  /// `Show less`
  String get expandableTextShowLess {
    return Intl.message(
      'Show less',
      name: 'expandableTextShowLess',
      desc: '',
      args: [],
    );
  }

  /// `(no title)`
  String get bookListItemNoTitle {
    return Intl.message(
      '(no title)',
      name: 'bookListItemNoTitle',
      desc: '',
      args: [],
    );
  }

  /// `by {author}`
  String bookListItemByAuthor(Object author) {
    return Intl.message(
      'by $author',
      name: 'bookListItemByAuthor',
      desc: '',
      args: [author],
    );
  }

  /// `Title:`
  String get infoTableTitle {
    return Intl.message(
      'Title:',
      name: 'infoTableTitle',
      desc: '',
      args: [],
    );
  }

  /// `Author(s):`
  String get infoTableAuthor {
    return Intl.message(
      'Author(s):',
      name: 'infoTableAuthor',
      desc: '',
      args: [],
    );
  }

  /// `Year:`
  String get infoTableYear {
    return Intl.message(
      'Year:',
      name: 'infoTableYear',
      desc: '',
      args: [],
    );
  }

  /// `Volume:`
  String get infoTableVolume {
    return Intl.message(
      'Volume:',
      name: 'infoTableVolume',
      desc: '',
      args: [],
    );
  }

  /// `Series:`
  String get infoTableSeries {
    return Intl.message(
      'Series:',
      name: 'infoTableSeries',
      desc: '',
      args: [],
    );
  }

  /// `Edition:`
  String get infoTableEdition {
    return Intl.message(
      'Edition:',
      name: 'infoTableEdition',
      desc: '',
      args: [],
    );
  }

  /// `Publisher:`
  String get infoTablePublisher {
    return Intl.message(
      'Publisher:',
      name: 'infoTablePublisher',
      desc: '',
      args: [],
    );
  }

  /// `City:`
  String get infoTableCity {
    return Intl.message(
      'City:',
      name: 'infoTableCity',
      desc: '',
      args: [],
    );
  }

  /// `Pages:`
  String get infoTablePages {
    return Intl.message(
      'Pages:',
      name: 'infoTablePages',
      desc: '',
      args: [],
    );
  }

  /// `Language:`
  String get infoTableLanguage {
    return Intl.message(
      'Language:',
      name: 'infoTableLanguage',
      desc: '',
      args: [],
    );
  }

  /// `ISBN(s):`
  String get infoTableISBN {
    return Intl.message(
      'ISBN(s):',
      name: 'infoTableISBN',
      desc: '',
      args: [],
    );
  }

  /// `DOI:`
  String get infoTableDOI {
    return Intl.message(
      'DOI:',
      name: 'infoTableDOI',
      desc: '',
      args: [],
    );
  }

  /// `File Size:`
  String get infoTableFileSize {
    return Intl.message(
      'File Size:',
      name: 'infoTableFileSize',
      desc: '',
      args: [],
    );
  }

  /// `File Extension:`
  String get infoTableFileExtension {
    return Intl.message(
      'File Extension:',
      name: 'infoTableFileExtension',
      desc: '',
      args: [],
    );
  }

  /// `{megabytes} MB ({kilobytes} KB)`
  String infoTableFileSizeMessage(Object megabytes, Object kilobytes) {
    return Intl.message(
      '$megabytes MB ($kilobytes KB)',
      name: 'infoTableFileSizeMessage',
      desc: '',
      args: [megabytes, kilobytes],
    );
  }

  /// `Relevance`
  String get filtersExtensionsRelevance {
    return Intl.message(
      'Relevance',
      name: 'filtersExtensionsRelevance',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get filtersExtensionsTitle {
    return Intl.message(
      'Title',
      name: 'filtersExtensionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get filtersExtensionsYear {
    return Intl.message(
      'Year',
      name: 'filtersExtensionsYear',
      desc: '',
      args: [],
    );
  }

  /// `Pages`
  String get filtersExtensionsPages {
    return Intl.message(
      'Pages',
      name: 'filtersExtensionsPages',
      desc: '',
      args: [],
    );
  }

  /// `File size`
  String get filtersExtensionsFileSize {
    return Intl.message(
      'File size',
      name: 'filtersExtensionsFileSize',
      desc: '',
      args: [],
    );
  }

  /// `Ascending`
  String get filtersExtensionsAscending {
    return Intl.message(
      'Ascending',
      name: 'filtersExtensionsAscending',
      desc: '',
      args: [],
    );
  }

  /// `Descending`
  String get filtersExtensionsDescending {
    return Intl.message(
      'Descending',
      name: 'filtersExtensionsDescending',
      desc: '',
      args: [],
    );
  }

  /// `Older first`
  String get filtersExtensionsOlderFirst {
    return Intl.message(
      'Older first',
      name: 'filtersExtensionsOlderFirst',
      desc: '',
      args: [],
    );
  }

  /// `Newer first`
  String get filtersExtensionsNewerFirst {
    return Intl.message(
      'Newer first',
      name: 'filtersExtensionsNewerFirst',
      desc: '',
      args: [],
    );
  }

  /// `Shorter first`
  String get filtersExtensionsShorterFirst {
    return Intl.message(
      'Shorter first',
      name: 'filtersExtensionsShorterFirst',
      desc: '',
      args: [],
    );
  }

  /// `Larger first`
  String get filtersExtensionsLargerFirst {
    return Intl.message(
      'Larger first',
      name: 'filtersExtensionsLargerFirst',
      desc: '',
      args: [],
    );
  }

  /// `Smaller first`
  String get filtersExtensionsSmallerFirst {
    return Intl.message(
      'Smaller first',
      name: 'filtersExtensionsSmallerFirst',
      desc: '',
      args: [],
    );
  }

  /// `Bigger first`
  String get filtersExtensionsBiggerFirst {
    return Intl.message(
      'Bigger first',
      name: 'filtersExtensionsBiggerFirst',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get filtersExtensionsAll {
    return Intl.message(
      'All',
      name: 'filtersExtensionsAll',
      desc: '',
      args: [],
    );
  }

  /// `Author`
  String get filtersExtensionsAuthor {
    return Intl.message(
      'Author',
      name: 'filtersExtensionsAuthor',
      desc: '',
      args: [],
    );
  }

  /// `Series`
  String get filtersExtensionsSeries {
    return Intl.message(
      'Series',
      name: 'filtersExtensionsSeries',
      desc: '',
      args: [],
    );
  }

  /// `Publisher`
  String get filtersExtensionsPublisher {
    return Intl.message(
      'Publisher',
      name: 'filtersExtensionsPublisher',
      desc: '',
      args: [],
    );
  }

  /// `ISBN`
  String get filtersExtensionsISBN {
    return Intl.message(
      'ISBN',
      name: 'filtersExtensionsISBN',
      desc: '',
      args: [],
    );
  }

  /// `MD5`
  String get filtersExtensionsMD5 {
    return Intl.message(
      'MD5',
      name: 'filtersExtensionsMD5',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'ES'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}