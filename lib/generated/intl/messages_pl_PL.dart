// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl_PL locale. All the
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
  String get localeName => 'pl_PL';

  static m0(author) => "napisane przez ${author}";

  static m1(author) => "napisane przez ${author}";

  static m2(megabytes, kilobytes) => "${megabytes} MB (${kilobytes} KB)";

  static m3(searchTerm) => "Brak wyników dla \"${searchTerm}\"";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "bookDetailsPresenterByAuthor" : m0,
    "bookDetailsPresenterDescription" : MessageLookupByLibrary.simpleMessage("Opis"),
    "bookDetailsPresenterInfo" : MessageLookupByLibrary.simpleMessage("Info"),
    "bookDetailsPresenterNoTitle" : MessageLookupByLibrary.simpleMessage("(bez tytułu)"),
    "bookDetailsPresenterTOC" : MessageLookupByLibrary.simpleMessage("Spis treści"),
    "bookListItemByAuthor" : m1,
    "bookListItemNoTitle" : MessageLookupByLibrary.simpleMessage("(bez tytułu)"),
    "downloadButtonCancel" : MessageLookupByLibrary.simpleMessage("Anuluj"),
    "downloadButtonConnectionFailedErrorMessage" : MessageLookupByLibrary.simpleMessage("Błąd sieci. Sprawdź swoje połączenie z internetem"),
    "downloadButtonDefaultExtension" : MessageLookupByLibrary.simpleMessage("TXT"),
    "downloadButtonDownloadFromBrowser" : MessageLookupByLibrary.simpleMessage("Plik jest wyjątkowo duży. Użyj przeglądarki by go pobrać"),
    "downloadButtonGenericErrorMessage" : MessageLookupByLibrary.simpleMessage("Wystąpił błąd podczas pobierania. Spróbuj ponownie później"),
    "downloadButtonLargeFile" : MessageLookupByLibrary.simpleMessage("Duży plik"),
    "downloadButtonOpenBrowser" : MessageLookupByLibrary.simpleMessage("Otwórz przeglądarkę"),
    "downloadButtonOpenSettings" : MessageLookupByLibrary.simpleMessage("Otwórz ustawienia"),
    "downloadButtonPermissionsDenied" : MessageLookupByLibrary.simpleMessage("Brak uprawnień"),
    "downloadButtonProvidePermissions" : MessageLookupByLibrary.simpleMessage("Przyznaj uprawnienia tej aplikacji poprzez ustawienia"),
    "downloadButtonStartingDownloadMessage" : MessageLookupByLibrary.simpleMessage("Rozpoczynanie pobierania"),
    "expandableTextShowLess" : MessageLookupByLibrary.simpleMessage("Pokaż mniej"),
    "expandableTextShowMore" : MessageLookupByLibrary.simpleMessage("Pokaż więcej"),
    "filtersExtensionsAll" : MessageLookupByLibrary.simpleMessage("Wszystkie"),
    "filtersExtensionsAscending" : MessageLookupByLibrary.simpleMessage("Rosnąco"),
    "filtersExtensionsAuthor" : MessageLookupByLibrary.simpleMessage("Autor"),
    "filtersExtensionsAzw" : MessageLookupByLibrary.simpleMessage("AZW"),
    "filtersExtensionsAzw3" : MessageLookupByLibrary.simpleMessage("AZW3"),
    "filtersExtensionsBiggerFirst" : MessageLookupByLibrary.simpleMessage("Od największych"),
    "filtersExtensionsDescending" : MessageLookupByLibrary.simpleMessage("Malejąco"),
    "filtersExtensionsEpub" : MessageLookupByLibrary.simpleMessage("EPUB"),
    "filtersExtensionsFb2" : MessageLookupByLibrary.simpleMessage("FB2"),
    "filtersExtensionsFileSize" : MessageLookupByLibrary.simpleMessage("Rozmiar pliku"),
    "filtersExtensionsISBN" : MessageLookupByLibrary.simpleMessage("ISBN"),
    "filtersExtensionsLargerFirst" : MessageLookupByLibrary.simpleMessage("Od najdłuższych"),
    "filtersExtensionsMD5" : MessageLookupByLibrary.simpleMessage("MD5"),
    "filtersExtensionsMobi" : MessageLookupByLibrary.simpleMessage("MOBI"),
    "filtersExtensionsNewerFirst" : MessageLookupByLibrary.simpleMessage("Od najnowszych"),
    "filtersExtensionsOlderFirst" : MessageLookupByLibrary.simpleMessage("Od najstarszych"),
    "filtersExtensionsPages" : MessageLookupByLibrary.simpleMessage("Strony"),
    "filtersExtensionsPdf" : MessageLookupByLibrary.simpleMessage("PDF"),
    "filtersExtensionsPublisher" : MessageLookupByLibrary.simpleMessage("Wydawnictwo"),
    "filtersExtensionsRelevance" : MessageLookupByLibrary.simpleMessage("Trafność"),
    "filtersExtensionsRtf" : MessageLookupByLibrary.simpleMessage("RTF"),
    "filtersExtensionsSeries" : MessageLookupByLibrary.simpleMessage("Seria"),
    "filtersExtensionsShorterFirst" : MessageLookupByLibrary.simpleMessage("Od najkrótszych"),
    "filtersExtensionsSmallerFirst" : MessageLookupByLibrary.simpleMessage("Od najmniejszych"),
    "filtersExtensionsTitle" : MessageLookupByLibrary.simpleMessage("Tytuł"),
    "filtersExtensionsTxt" : MessageLookupByLibrary.simpleMessage("TXT"),
    "filtersExtensionsYear" : MessageLookupByLibrary.simpleMessage("Rok"),
    "infoDialogAlertDialogRightButtonText" : MessageLookupByLibrary.simpleMessage("Zamknij"),
    "infoTableAuthor" : MessageLookupByLibrary.simpleMessage("Autor (autorzy):"),
    "infoTableCity" : MessageLookupByLibrary.simpleMessage("Miasto:"),
    "infoTableDOI" : MessageLookupByLibrary.simpleMessage("DOI:"),
    "infoTableEdition" : MessageLookupByLibrary.simpleMessage("Edycja:"),
    "infoTableFileExtension" : MessageLookupByLibrary.simpleMessage("Rozszerzenie pliku:"),
    "infoTableFileSize" : MessageLookupByLibrary.simpleMessage("Rozmiar pliku:"),
    "infoTableFileSizeMessage" : m2,
    "infoTableISBN" : MessageLookupByLibrary.simpleMessage("ISBN(s):"),
    "infoTableLanguage" : MessageLookupByLibrary.simpleMessage("Język:"),
    "infoTablePages" : MessageLookupByLibrary.simpleMessage("Strony:"),
    "infoTablePublisher" : MessageLookupByLibrary.simpleMessage("Wydawnicwo:"),
    "infoTableSeries" : MessageLookupByLibrary.simpleMessage("Seria:"),
    "infoTableTitle" : MessageLookupByLibrary.simpleMessage("Tytuł:"),
    "infoTableVolume" : MessageLookupByLibrary.simpleMessage("Tom:"),
    "infoTableYear" : MessageLookupByLibrary.simpleMessage("Rok:"),
    "resultsBuilderConnectionFailedErrorMessage" : MessageLookupByLibrary.simpleMessage("Błąd sieci.\nSprawdź swoje połączenie z internetem"),
    "resultsBuilderGenericErrorMessage" : MessageLookupByLibrary.simpleMessage("Ups! Coś poszło nie tak.\nSpróbuj ponownie później"),
    "resultsBuilderNoMoreResultsMessage" : MessageLookupByLibrary.simpleMessage("Nie ma więcej wyników!"),
    "resultsBuilderNoResultsForSearchTermMessage" : m3,
    "resultsBuilderTotalResultsCounterMessage" : MessageLookupByLibrary.simpleMessage(" wyników"),
    "searchBookDelegateSearchFieldLabel" : MessageLookupByLibrary.simpleMessage("Tytuł, autor lub ISBN"),
    "searchBookScreenAboutFloatingButtomTitle" : MessageLookupByLibrary.simpleMessage("O aplikacji"),
    "searchBookScreenApplicationLegalese" : MessageLookupByLibrary.simpleMessage("LibGen Mobile jest projetem FOSS (oprogramowanie wolne oraz open-source). Twórca aplikacji nie jest związany w jakikolwiek sposób z Library Genesis.\n\nJak na razie, aplikacja daje dostęp tylko i wyłącznie do sekcji \"Sci-Tech\".\n\nPliki pobierane są do domyślnego folderu Downloads."),
    "searchBookScreenSearchBarHint" : MessageLookupByLibrary.simpleMessage("Wyszukaj po tytule, autorze lub ISBN"),
    "showFilterDialogApply" : MessageLookupByLibrary.simpleMessage("Zastosuj"),
    "showFilterDialogCancel" : MessageLookupByLibrary.simpleMessage("Anuluj"),
    "showFilterDialogExtensionLabel" : MessageLookupByLibrary.simpleMessage("Rozszerzenie pliku"),
    "showFilterDialogLanguageLabel" : MessageLookupByLibrary.simpleMessage("Język"),
    "showFilterDialogSearchInLabel" : MessageLookupByLibrary.simpleMessage("Szukaj w"),
    "showFilterDialogSortByLabel" : MessageLookupByLibrary.simpleMessage("Sortuj według"),
    "showFilterDialogTitle" : MessageLookupByLibrary.simpleMessage("Filtr"),
    "showFilterDialogWildcardWordsLabel" : MessageLookupByLibrary.simpleMessage("Symbol wieloznaczny")
  };
}
