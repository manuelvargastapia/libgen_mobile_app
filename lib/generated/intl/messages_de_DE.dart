// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de_DE locale. All the
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
  String get localeName => 'de_DE';

  static m0(author) => "von ${author}";

  static m1(author) => "von ${author}";

  static m2(megabytes, kilobytes) => "${megabytes} MB (${kilobytes} KB)";

  static m3(searchTerm) => "Keine Ergebnisse für \"${searchTerm}\"";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "bookDetailsPresenterByAuthor" : m0,
    "bookDetailsPresenterDescription" : MessageLookupByLibrary.simpleMessage("Beschreibung"),
    "bookDetailsPresenterInfo" : MessageLookupByLibrary.simpleMessage("Informationen"),
    "bookDetailsPresenterNoTitle" : MessageLookupByLibrary.simpleMessage("(kein Titel)"),
    "bookDetailsPresenterTOC" : MessageLookupByLibrary.simpleMessage("Inhaltsverzeichnis"),
    "bookListItemByAuthor" : m1,
    "bookListItemNoTitle" : MessageLookupByLibrary.simpleMessage("(kein Titel)"),
    "downloadButtonCancel" : MessageLookupByLibrary.simpleMessage("Abbrechen"),
    "downloadButtonConnectionFailedErrorMessage" : MessageLookupByLibrary.simpleMessage("Netzwerkfehler. Bitte überprüfen Sie Ihre Internetverbindung"),
    "downloadButtonDefaultExtension" : MessageLookupByLibrary.simpleMessage("TXT"),
    "downloadButtonDownloadFromBrowser" : MessageLookupByLibrary.simpleMessage("Die Datei ist riesig! Bitte verwenden Sie den Browser zum Herunterladen"),
    "downloadButtonGenericErrorMessage" : MessageLookupByLibrary.simpleMessage("Fehler beim Download. Versuchen Sie es später noch einmal, bitte"),
    "downloadButtonLargeFile" : MessageLookupByLibrary.simpleMessage("Große Datei"),
    "downloadButtonOpenBrowser" : MessageLookupByLibrary.simpleMessage("Browser öffnen"),
    "downloadButtonOpenSettings" : MessageLookupByLibrary.simpleMessage("Einstellungen öffnen"),
    "downloadButtonPermissionsDenied" : MessageLookupByLibrary.simpleMessage("Berechtigungen verweigert"),
    "downloadButtonProvidePermissions" : MessageLookupByLibrary.simpleMessage("Bitte geben Sie die Berechtigungen für die App in den App-Einstellungen an"),
    "downloadButtonStartingDownloadMessage" : MessageLookupByLibrary.simpleMessage("Starte Download"),
    "expandableTextShowLess" : MessageLookupByLibrary.simpleMessage("Weniger anzeigen"),
    "expandableTextShowMore" : MessageLookupByLibrary.simpleMessage("Mehr anzeigen"),
    "filtersExtensionsAll" : MessageLookupByLibrary.simpleMessage("Alle"),
    "filtersExtensionsAscending" : MessageLookupByLibrary.simpleMessage("Aufsteigend"),
    "filtersExtensionsAuthor" : MessageLookupByLibrary.simpleMessage("Authoren"),
    "filtersExtensionsAzw" : MessageLookupByLibrary.simpleMessage("AZW"),
    "filtersExtensionsAzw3" : MessageLookupByLibrary.simpleMessage("AZW3"),
    "filtersExtensionsBiggerFirst" : MessageLookupByLibrary.simpleMessage("Größere zuerst"),
    "filtersExtensionsDescending" : MessageLookupByLibrary.simpleMessage("Absteigend"),
    "filtersExtensionsEpub" : MessageLookupByLibrary.simpleMessage("EPUB"),
    "filtersExtensionsFb2" : MessageLookupByLibrary.simpleMessage("FB2"),
    "filtersExtensionsFileSize" : MessageLookupByLibrary.simpleMessage("Dateigröße"),
    "filtersExtensionsISBN" : MessageLookupByLibrary.simpleMessage("ISBN"),
    "filtersExtensionsLargerFirst" : MessageLookupByLibrary.simpleMessage("Größere zuerst"),
    "filtersExtensionsMD5" : MessageLookupByLibrary.simpleMessage("MD5"),
    "filtersExtensionsMobi" : MessageLookupByLibrary.simpleMessage("MOBI"),
    "filtersExtensionsNewerFirst" : MessageLookupByLibrary.simpleMessage("Neuere zuerst"),
    "filtersExtensionsOlderFirst" : MessageLookupByLibrary.simpleMessage("Ältere zuerst"),
    "filtersExtensionsPages" : MessageLookupByLibrary.simpleMessage("Seiten"),
    "filtersExtensionsPdf" : MessageLookupByLibrary.simpleMessage("PDF"),
    "filtersExtensionsPublisher" : MessageLookupByLibrary.simpleMessage("Verlag"),
    "filtersExtensionsRelevance" : MessageLookupByLibrary.simpleMessage("Relevanz"),
    "filtersExtensionsRtf" : MessageLookupByLibrary.simpleMessage("RTF"),
    "filtersExtensionsSeries" : MessageLookupByLibrary.simpleMessage("Serien"),
    "filtersExtensionsShorterFirst" : MessageLookupByLibrary.simpleMessage("Kürzere zuerst"),
    "filtersExtensionsSmallerFirst" : MessageLookupByLibrary.simpleMessage("Kleine zuerst"),
    "filtersExtensionsTitle" : MessageLookupByLibrary.simpleMessage("Titel"),
    "filtersExtensionsTxt" : MessageLookupByLibrary.simpleMessage("TXT"),
    "filtersExtensionsYear" : MessageLookupByLibrary.simpleMessage("Jahr"),
    "infoDialogAlertDialogRightButtonText" : MessageLookupByLibrary.simpleMessage("Schließen"),
    "infoTableAuthor" : MessageLookupByLibrary.simpleMessage("Author(en):"),
    "infoTableCity" : MessageLookupByLibrary.simpleMessage("Stadt:"),
    "infoTableDOI" : MessageLookupByLibrary.simpleMessage("DOI:"),
    "infoTableEdition" : MessageLookupByLibrary.simpleMessage("Edition:"),
    "infoTableFileExtension" : MessageLookupByLibrary.simpleMessage("Dateiendung:"),
    "infoTableFileSize" : MessageLookupByLibrary.simpleMessage("Dateigröße:"),
    "infoTableFileSizeMessage" : m2,
    "infoTableISBN" : MessageLookupByLibrary.simpleMessage("ISBN(s):"),
    "infoTableLanguage" : MessageLookupByLibrary.simpleMessage("Sprache:"),
    "infoTablePages" : MessageLookupByLibrary.simpleMessage("Seiten:"),
    "infoTablePublisher" : MessageLookupByLibrary.simpleMessage("Verlag:"),
    "infoTableSeries" : MessageLookupByLibrary.simpleMessage("Serie:"),
    "infoTableTitle" : MessageLookupByLibrary.simpleMessage("Titel:"),
    "infoTableVolume" : MessageLookupByLibrary.simpleMessage("Band:"),
    "infoTableYear" : MessageLookupByLibrary.simpleMessage("Jahr:"),
    "resultsBuilderConnectionFailedErrorMessage" : MessageLookupByLibrary.simpleMessage("Netzwerk Fehler.\nBitte überprüfen Sie Ihre Internetverbindung"),
    "resultsBuilderGenericErrorMessage" : MessageLookupByLibrary.simpleMessage("Ups! Unser Fehler!\nVersuche es später noch einmal."),
    "resultsBuilderNoMoreResultsMessage" : MessageLookupByLibrary.simpleMessage("Keine Ergebnisse mehr!"),
    "resultsBuilderNoResultsForSearchTermMessage" : m3,
    "resultsBuilderTotalResultsCounterMessage" : MessageLookupByLibrary.simpleMessage(" Ergebnisse"),
    "searchBookDelegateSearchFieldLabel" : MessageLookupByLibrary.simpleMessage("Titel, Author oder ISBN"),
    "searchBookScreenAboutFloatingButtomTitle" : MessageLookupByLibrary.simpleMessage("Über"),
    "searchBookScreenApplicationLegalese" : MessageLookupByLibrary.simpleMessage("LibGen Mobile ist ein FLOSS-Projekt (Free/Libre Open Source Software). Der Entwickler ist in irgendeiner Weise mit Library Genesis verbunden.\n\nDiese App bietet derzeit nur Zugriff auf den Bereich Sci-Tech.\n\nDer Zielordner für heruntergeladene Dateien ist das Standardverzeichnis Downloads."),
    "searchBookScreenSearchBarHint" : MessageLookupByLibrary.simpleMessage("Nach Titel, Author oder ISBN suchen"),
    "showFilterDialogApply" : MessageLookupByLibrary.simpleMessage("Anwenden"),
    "showFilterDialogCancel" : MessageLookupByLibrary.simpleMessage("Abbrechen"),
    "showFilterDialogSearchInLabel" : MessageLookupByLibrary.simpleMessage("Suche in"),
    "showFilterDialogSortByLabel" : MessageLookupByLibrary.simpleMessage("Sortiere nach"),
    "showFilterDialogTitle" : MessageLookupByLibrary.simpleMessage("Filter")
  };
}
