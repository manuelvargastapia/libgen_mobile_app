// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_RCN locale. All the
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
  String get localeName => 'zh_RCN';

  static m0(author) => "按 ${author}";

  static m1(author) => "按 ${author}";

  static m2(megabytes, kilobytes) => "${megabytes} MB (${kilobytes} KB)";

  static m3(searchTerm) => "没有 \"${searchTerm}\" 的搜索结果";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "bookDetailsPresenterByAuthor" : m0,
    "bookDetailsPresenterDescription" : MessageLookupByLibrary.simpleMessage("描述"),
    "bookDetailsPresenterInfo" : MessageLookupByLibrary.simpleMessage("信息"),
    "bookDetailsPresenterNoTitle" : MessageLookupByLibrary.simpleMessage("(无标题)"),
    "bookDetailsPresenterTOC" : MessageLookupByLibrary.simpleMessage("目录"),
    "bookListItemByAuthor" : m1,
    "bookListItemNoTitle" : MessageLookupByLibrary.simpleMessage("(无标题)"),
    "downloadButtonCancel" : MessageLookupByLibrary.simpleMessage("取消"),
    "downloadButtonConnectionFailedErrorMessage" : MessageLookupByLibrary.simpleMessage("网络错误，请检查你的互联网连接"),
    "downloadButtonDefaultExtension" : MessageLookupByLibrary.simpleMessage("TXT"),
    "downloadButtonDownloadFromBrowser" : MessageLookupByLibrary.simpleMessage("文件巨大，请使用浏览器进行下载"),
    "downloadButtonGenericErrorMessage" : MessageLookupByLibrary.simpleMessage("下载出错。请稍候再试。"),
    "downloadButtonLargeFile" : MessageLookupByLibrary.simpleMessage("大文件"),
    "downloadButtonOpenBrowser" : MessageLookupByLibrary.simpleMessage("打开浏览器"),
    "downloadButtonOpenSettings" : MessageLookupByLibrary.simpleMessage("打开设置"),
    "downloadButtonPermissionsDenied" : MessageLookupByLibrary.simpleMessage("权限被拒绝"),
    "downloadButtonProvidePermissions" : MessageLookupByLibrary.simpleMessage("请从系统的应用设置处提供所需权限"),
    "downloadButtonStartingDownloadMessage" : MessageLookupByLibrary.simpleMessage("开始下载"),
    "expandableTextShowLess" : MessageLookupByLibrary.simpleMessage("显示更少"),
    "expandableTextShowMore" : MessageLookupByLibrary.simpleMessage("显示更多"),
    "filtersExtensionsAll" : MessageLookupByLibrary.simpleMessage("全部"),
    "filtersExtensionsAscending" : MessageLookupByLibrary.simpleMessage("升序"),
    "filtersExtensionsAuthor" : MessageLookupByLibrary.simpleMessage("作者"),
    "filtersExtensionsBiggerFirst" : MessageLookupByLibrary.simpleMessage("较大的在前"),
    "filtersExtensionsDescending" : MessageLookupByLibrary.simpleMessage("降序"),
    "filtersExtensionsFileSize" : MessageLookupByLibrary.simpleMessage("文件大小"),
    "filtersExtensionsISBN" : MessageLookupByLibrary.simpleMessage("ISBN"),
    "filtersExtensionsLargerFirst" : MessageLookupByLibrary.simpleMessage("较长的在前"),
    "filtersExtensionsMD5" : MessageLookupByLibrary.simpleMessage("MD5"),
    "filtersExtensionsNewerFirst" : MessageLookupByLibrary.simpleMessage("较新的在前"),
    "filtersExtensionsOlderFirst" : MessageLookupByLibrary.simpleMessage("较旧的在前"),
    "filtersExtensionsPages" : MessageLookupByLibrary.simpleMessage("页数"),
    "filtersExtensionsPublisher" : MessageLookupByLibrary.simpleMessage("出版商"),
    "filtersExtensionsRelevance" : MessageLookupByLibrary.simpleMessage("相关度"),
    "filtersExtensionsSeries" : MessageLookupByLibrary.simpleMessage("系列"),
    "filtersExtensionsShorterFirst" : MessageLookupByLibrary.simpleMessage("较短的在前"),
    "filtersExtensionsSmallerFirst" : MessageLookupByLibrary.simpleMessage("较小的在前"),
    "filtersExtensionsTitle" : MessageLookupByLibrary.simpleMessage("标题"),
    "filtersExtensionsYear" : MessageLookupByLibrary.simpleMessage("年份"),
    "infoDialogAlertDialogRightButtonText" : MessageLookupByLibrary.simpleMessage("关闭"),
    "infoTableAuthor" : MessageLookupByLibrary.simpleMessage("作者："),
    "infoTableCity" : MessageLookupByLibrary.simpleMessage("城市："),
    "infoTableDOI" : MessageLookupByLibrary.simpleMessage("DOI："),
    "infoTableEdition" : MessageLookupByLibrary.simpleMessage("版本："),
    "infoTableFileExtension" : MessageLookupByLibrary.simpleMessage("文件扩展名："),
    "infoTableFileSize" : MessageLookupByLibrary.simpleMessage("文件大小："),
    "infoTableFileSizeMessage" : m2,
    "infoTableISBN" : MessageLookupByLibrary.simpleMessage("ISBN(s)："),
    "infoTableLanguage" : MessageLookupByLibrary.simpleMessage("语言"),
    "infoTablePages" : MessageLookupByLibrary.simpleMessage("页数："),
    "infoTablePublisher" : MessageLookupByLibrary.simpleMessage("出版商："),
    "infoTableSeries" : MessageLookupByLibrary.simpleMessage("系列："),
    "infoTableTitle" : MessageLookupByLibrary.simpleMessage("标题："),
    "infoTableVolume" : MessageLookupByLibrary.simpleMessage("卷："),
    "infoTableYear" : MessageLookupByLibrary.simpleMessage("年份："),
    "resultsBuilderConnectionFailedErrorMessage" : MessageLookupByLibrary.simpleMessage("网络错误。\n请检查你的互联网连接。"),
    "resultsBuilderGenericErrorMessage" : MessageLookupByLibrary.simpleMessage("哎呀，出了点问题。\n请稍候再试"),
    "resultsBuilderNoMoreResultsMessage" : MessageLookupByLibrary.simpleMessage("没有更多结果！"),
    "resultsBuilderNoResultsForSearchTermMessage" : m3,
    "resultsBuilderTotalResultsCounterMessage" : MessageLookupByLibrary.simpleMessage("结果"),
    "searchBookDelegateSearchFieldLabel" : MessageLookupByLibrary.simpleMessage("标题、作者或 ISBN"),
    "searchBookScreenAboutFloatingButtomTitle" : MessageLookupByLibrary.simpleMessage("关于"),
    "searchBookScreenApplicationLegalese" : MessageLookupByLibrary.simpleMessage("LibGen Mobile 是一个自由开源软件项目。本应用开发者与 Library Genesis 没有任何关系。\n\n这款应用眼下只提供对科技板块的访问。\n\n所下载文件的目标文件夹是默认的下载目录。"),
    "searchBookScreenSearchBarHint" : MessageLookupByLibrary.simpleMessage("按标题、作者或 ISBN 进行搜索"),
    "showFilterDialogApply" : MessageLookupByLibrary.simpleMessage("应用"),
    "showFilterDialogCancel" : MessageLookupByLibrary.simpleMessage("取消"),
    "showFilterDialogSearchInLabel" : MessageLookupByLibrary.simpleMessage("搜索范围"),
    "showFilterDialogSortByLabel" : MessageLookupByLibrary.simpleMessage("排序依据"),
    "showFilterDialogTitle" : MessageLookupByLibrary.simpleMessage("过滤器")
  };
}
