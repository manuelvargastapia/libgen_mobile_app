// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja_JP locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ja_JP';

  static m0(author) => "${author}";

  static m1(author) => "${author}";

  static m2(megabytes, kilobytes) => "${megabytes} MB (${kilobytes} KB)";

  static m3(searchTerm) => "\"${searchTerm}\"の結果はありません";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "bookDetailsPresenterByAuthor" : m0,
    "bookDetailsPresenterDescription" : MessageLookupByLibrary.simpleMessage("説明"),
    "bookDetailsPresenterInfo" : MessageLookupByLibrary.simpleMessage("情報"),
    "bookDetailsPresenterNoTitle" : MessageLookupByLibrary.simpleMessage("(タイトル なし)"),
    "bookDetailsPresenterTOC" : MessageLookupByLibrary.simpleMessage("目次"),
    "bookListItemByAuthor" : m1,
    "bookListItemNoTitle" : MessageLookupByLibrary.simpleMessage("(タイトル なし)"),
    "downloadButtonCancel" : MessageLookupByLibrary.simpleMessage("キャンセル"),
    "downloadButtonConnectionFailedErrorMessage" : MessageLookupByLibrary.simpleMessage("ネットワークエラー。インターネット接続を確認してください"),
    "downloadButtonDefaultExtension" : MessageLookupByLibrary.simpleMessage("TXT"),
    "downloadButtonDownloadFromBrowser" : MessageLookupByLibrary.simpleMessage("ファイルは巨大です！ブラウザを使用してダウンロードしてください"),
    "downloadButtonGenericErrorMessage" : MessageLookupByLibrary.simpleMessage("ダウンロードエラー。後でもう一度やり直してください"),
    "downloadButtonLargeFile" : MessageLookupByLibrary.simpleMessage("大きなファイル"),
    "downloadButtonOpenBrowser" : MessageLookupByLibrary.simpleMessage("ブラウザを開く"),
    "downloadButtonOpenSettings" : MessageLookupByLibrary.simpleMessage("設定"),
    "downloadButtonPermissionsDenied" : MessageLookupByLibrary.simpleMessage("許可が拒否されました"),
    "downloadButtonProvidePermissions" : MessageLookupByLibrary.simpleMessage("設定からアプリの権限を有効にしてください"),
    "downloadButtonStartingDownloadMessage" : MessageLookupByLibrary.simpleMessage("ダウンロードの開始"),
    "expandableTextShowLess" : MessageLookupByLibrary.simpleMessage("隠す"),
    "expandableTextShowMore" : MessageLookupByLibrary.simpleMessage("もっと見せる"),
    "filtersExtensionsAll" : MessageLookupByLibrary.simpleMessage("すべて"),
    "filtersExtensionsAscending" : MessageLookupByLibrary.simpleMessage("昇順"),
    "filtersExtensionsAuthor" : MessageLookupByLibrary.simpleMessage("著者"),
    "filtersExtensionsAzw" : MessageLookupByLibrary.simpleMessage("AZW"),
    "filtersExtensionsAzw3" : MessageLookupByLibrary.simpleMessage("AZW3"),
    "filtersExtensionsBiggerFirst" : MessageLookupByLibrary.simpleMessage("最初に重い"),
    "filtersExtensionsDescending" : MessageLookupByLibrary.simpleMessage("降順"),
    "filtersExtensionsEpub" : MessageLookupByLibrary.simpleMessage("EPUB"),
    "filtersExtensionsFb2" : MessageLookupByLibrary.simpleMessage("FB2"),
    "filtersExtensionsFileSize" : MessageLookupByLibrary.simpleMessage("ファイルサイズ"),
    "filtersExtensionsISBN" : MessageLookupByLibrary.simpleMessage("ISBN"),
    "filtersExtensionsLargerFirst" : MessageLookupByLibrary.simpleMessage("最初に最長"),
    "filtersExtensionsMD5" : MessageLookupByLibrary.simpleMessage("MD5"),
    "filtersExtensionsMobi" : MessageLookupByLibrary.simpleMessage("MOBI"),
    "filtersExtensionsNewerFirst" : MessageLookupByLibrary.simpleMessage("最初に新しい"),
    "filtersExtensionsOlderFirst" : MessageLookupByLibrary.simpleMessage("最初に古い"),
    "filtersExtensionsPages" : MessageLookupByLibrary.simpleMessage("ページ"),
    "filtersExtensionsPdf" : MessageLookupByLibrary.simpleMessage("PDF"),
    "filtersExtensionsPublisher" : MessageLookupByLibrary.simpleMessage("編集"),
    "filtersExtensionsRelevance" : MessageLookupByLibrary.simpleMessage("関連性"),
    "filtersExtensionsRtf" : MessageLookupByLibrary.simpleMessage("RTF"),
    "filtersExtensionsSeries" : MessageLookupByLibrary.simpleMessage("シリーズ"),
    "filtersExtensionsShorterFirst" : MessageLookupByLibrary.simpleMessage("最初に短い"),
    "filtersExtensionsSmallerFirst" : MessageLookupByLibrary.simpleMessage("最初に軽い"),
    "filtersExtensionsTitle" : MessageLookupByLibrary.simpleMessage("タイトル"),
    "filtersExtensionsTxt" : MessageLookupByLibrary.simpleMessage("TXT"),
    "filtersExtensionsYear" : MessageLookupByLibrary.simpleMessage("年"),
    "infoDialogAlertDialogRightButtonText" : MessageLookupByLibrary.simpleMessage("閉じる"),
    "infoTableAuthor" : MessageLookupByLibrary.simpleMessage("著者:"),
    "infoTableCity" : MessageLookupByLibrary.simpleMessage("シティ:"),
    "infoTableDOI" : MessageLookupByLibrary.simpleMessage("DOI:"),
    "infoTableEdition" : MessageLookupByLibrary.simpleMessage("エディション:"),
    "infoTableFileExtension" : MessageLookupByLibrary.simpleMessage("ファイルの種類:"),
    "infoTableFileSize" : MessageLookupByLibrary.simpleMessage("ファイルサイズ:"),
    "infoTableFileSizeMessage" : m2,
    "infoTableISBN" : MessageLookupByLibrary.simpleMessage("ISBN(s):"),
    "infoTableLanguage" : MessageLookupByLibrary.simpleMessage("言語:"),
    "infoTablePages" : MessageLookupByLibrary.simpleMessage("ページ:"),
    "infoTablePublisher" : MessageLookupByLibrary.simpleMessage("編集:"),
    "infoTableSeries" : MessageLookupByLibrary.simpleMessage("シリーズ:"),
    "infoTableTitle" : MessageLookupByLibrary.simpleMessage("タイトル:"),
    "infoTableVolume" : MessageLookupByLibrary.simpleMessage("ボリューム:"),
    "infoTableYear" : MessageLookupByLibrary.simpleMessage("年:"),
    "resultsBuilderConnectionFailedErrorMessage" : MessageLookupByLibrary.simpleMessage("ネットワークエラー。\nインターネット接続を確認してください"),
    "resultsBuilderGenericErrorMessage" : MessageLookupByLibrary.simpleMessage("おっと！私たちはそれを台無しにしました。\n後でもう一度やり直してください"),
    "resultsBuilderNoMoreResultsMessage" : MessageLookupByLibrary.simpleMessage("これ以上の結果はありません！"),
    "resultsBuilderNoResultsForSearchTermMessage" : m3,
    "resultsBuilderTotalResultsCounterMessage" : MessageLookupByLibrary.simpleMessage(" 件の結果"),
    "searchBookDelegateSearchFieldLabel" : MessageLookupByLibrary.simpleMessage("タイトル、著者、またはISBN"),
    "searchBookScreenAboutFloatingButtomTitle" : MessageLookupByLibrary.simpleMessage("約"),
    "searchBookScreenApplicationLegalese" : MessageLookupByLibrary.simpleMessage("LibGen Mobileは、FLOSS（フリー/リブレオープンソースソフトウェア）プロジェクトです。開発者は、LibraryGenesisに何らかの形で関係しています。\n\nダウンロードされたファイルの宛先フォルダーは、デフォルトのダウンロードディレクトリです。"),
    "searchBookScreenSearchBarHint" : MessageLookupByLibrary.simpleMessage("タイトル、著者、またはISBNで検索"),
    "showFilterDialogApply" : MessageLookupByLibrary.simpleMessage("適用する"),
    "showFilterDialogCancel" : MessageLookupByLibrary.simpleMessage("キャンセル"),
    "showFilterDialogExtensionLabel" : MessageLookupByLibrary.simpleMessage("ファイルの種類"),
    "showFilterDialogLanguageLabel" : MessageLookupByLibrary.simpleMessage("言語"),
    "showFilterDialogSearchInLabel" : MessageLookupByLibrary.simpleMessage("検索"),
    "showFilterDialogSortByLabel" : MessageLookupByLibrary.simpleMessage("並び替え"),
    "showFilterDialogTitle" : MessageLookupByLibrary.simpleMessage("フィルタ"),
    "showFilterDialogWildcardWordsLabel" : MessageLookupByLibrary.simpleMessage("ワイルドカード")
  };
}
