// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr_FR locale. All the
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
  String get localeName => 'fr_FR';

  static m0(author) => "par ${author}";

  static m1(author) => "par ${author}";

  static m2(megabytes, kilobytes) => "${megabytes} Mo (${kilobytes} Ko)";

  static m3(searchTerm) => "Aucun résultat pour \"${searchTerm}\"";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "bookDetailsPresenterByAuthor" : m0,
    "bookDetailsPresenterDescription" : MessageLookupByLibrary.simpleMessage("Description"),
    "bookDetailsPresenterInfo" : MessageLookupByLibrary.simpleMessage("Info"),
    "bookDetailsPresenterNoTitle" : MessageLookupByLibrary.simpleMessage("(Pas de titre)"),
    "bookDetailsPresenterTOC" : MessageLookupByLibrary.simpleMessage("Table des matières"),
    "bookListItemByAuthor" : m1,
    "bookListItemNoTitle" : MessageLookupByLibrary.simpleMessage("(Pas de titre)"),
    "downloadButtonCancel" : MessageLookupByLibrary.simpleMessage("Annuler"),
    "downloadButtonConnectionFailedErrorMessage" : MessageLookupByLibrary.simpleMessage("Erreur réseau. Veuillez vérifier votre connexion Internet."),
    "downloadButtonDefaultExtension" : MessageLookupByLibrary.simpleMessage("TXT"),
    "downloadButtonDownloadFromBrowser" : MessageLookupByLibrary.simpleMessage("Le fichier est énorme ! Veuillez utiliser le navigateur pour télécharger"),
    "downloadButtonGenericErrorMessage" : MessageLookupByLibrary.simpleMessage("Erreur de téléchargement Veuillez réessayer plus tard."),
    "downloadButtonLargeFile" : MessageLookupByLibrary.simpleMessage("Gros fichier"),
    "downloadButtonOpenBrowser" : MessageLookupByLibrary.simpleMessage("Ouvrir navigateur"),
    "downloadButtonOpenSettings" : MessageLookupByLibrary.simpleMessage("Ouvrir paramètres"),
    "downloadButtonPermissionsDenied" : MessageLookupByLibrary.simpleMessage("Permissions refusées"),
    "downloadButtonProvidePermissions" : MessageLookupByLibrary.simpleMessage("Veuillez fournir les permissions depuis les paramètres de l’application"),
    "downloadButtonStartingDownloadMessage" : MessageLookupByLibrary.simpleMessage("Commencer le téléchargement"),
    "expandableTextShowLess" : MessageLookupByLibrary.simpleMessage("Voir moins"),
    "expandableTextShowMore" : MessageLookupByLibrary.simpleMessage("Voir plus"),
    "filtersExtensionsAll" : MessageLookupByLibrary.simpleMessage("Tous"),
    "filtersExtensionsAscending" : MessageLookupByLibrary.simpleMessage("Croissant"),
    "filtersExtensionsAuthor" : MessageLookupByLibrary.simpleMessage("Auteur"),
    "filtersExtensionsBiggerFirst" : MessageLookupByLibrary.simpleMessage("Plus gros"),
    "filtersExtensionsDescending" : MessageLookupByLibrary.simpleMessage("Décroissant"),
    "filtersExtensionsFileSize" : MessageLookupByLibrary.simpleMessage("Taille du fichier"),
    "filtersExtensionsISBN" : MessageLookupByLibrary.simpleMessage("ISBN"),
    "filtersExtensionsLargerFirst" : MessageLookupByLibrary.simpleMessage("Plus long"),
    "filtersExtensionsMD5" : MessageLookupByLibrary.simpleMessage("MD5"),
    "filtersExtensionsNewerFirst" : MessageLookupByLibrary.simpleMessage("Plus récent"),
    "filtersExtensionsOlderFirst" : MessageLookupByLibrary.simpleMessage("Plus ancien"),
    "filtersExtensionsPages" : MessageLookupByLibrary.simpleMessage("Pages"),
    "filtersExtensionsPublisher" : MessageLookupByLibrary.simpleMessage("Éditeur"),
    "filtersExtensionsRelevance" : MessageLookupByLibrary.simpleMessage("Pertinence"),
    "filtersExtensionsSeries" : MessageLookupByLibrary.simpleMessage("Série"),
    "filtersExtensionsShorterFirst" : MessageLookupByLibrary.simpleMessage("Plus court"),
    "filtersExtensionsSmallerFirst" : MessageLookupByLibrary.simpleMessage("Plus petit"),
    "filtersExtensionsTitle" : MessageLookupByLibrary.simpleMessage("Titre"),
    "filtersExtensionsYear" : MessageLookupByLibrary.simpleMessage("Année"),
    "infoDialogAlertDialogRightButtonText" : MessageLookupByLibrary.simpleMessage("Fermer"),
    "infoTableAuthor" : MessageLookupByLibrary.simpleMessage("Auteur(s) :"),
    "infoTableCity" : MessageLookupByLibrary.simpleMessage("Ville :"),
    "infoTableDOI" : MessageLookupByLibrary.simpleMessage("OID :"),
    "infoTableEdition" : MessageLookupByLibrary.simpleMessage("Édition :"),
    "infoTableFileExtension" : MessageLookupByLibrary.simpleMessage("Extension du fichier :"),
    "infoTableFileSize" : MessageLookupByLibrary.simpleMessage("Taille du fichier :"),
    "infoTableFileSizeMessage" : m2,
    "infoTableISBN" : MessageLookupByLibrary.simpleMessage("ISBN(s) :"),
    "infoTableLanguage" : MessageLookupByLibrary.simpleMessage("Langage :"),
    "infoTablePages" : MessageLookupByLibrary.simpleMessage("Pages :"),
    "infoTablePublisher" : MessageLookupByLibrary.simpleMessage("Éditeur :"),
    "infoTableSeries" : MessageLookupByLibrary.simpleMessage("Série :"),
    "infoTableTitle" : MessageLookupByLibrary.simpleMessage("Titre :"),
    "infoTableVolume" : MessageLookupByLibrary.simpleMessage("Volume :"),
    "infoTableYear" : MessageLookupByLibrary.simpleMessage("Année :"),
    "resultsBuilderConnectionFailedErrorMessage" : MessageLookupByLibrary.simpleMessage("Erreur réseau.\nVeuillez vérifier votre connexion Internet."),
    "resultsBuilderGenericErrorMessage" : MessageLookupByLibrary.simpleMessage("Oups ! Nous nous sommes ratés.\nVeuillez réessayer plus tard."),
    "resultsBuilderNoMoreResultsMessage" : MessageLookupByLibrary.simpleMessage("Fin des résultats !"),
    "resultsBuilderNoResultsForSearchTermMessage" : m3,
    "resultsBuilderTotalResultsCounterMessage" : MessageLookupByLibrary.simpleMessage(" résultats"),
    "searchBookDelegateSearchFieldLabel" : MessageLookupByLibrary.simpleMessage("Titre, auteur ou ISBN"),
    "searchBookScreenAboutFloatingButtomTitle" : MessageLookupByLibrary.simpleMessage("À propos"),
    "searchBookScreenApplicationLegalese" : MessageLookupByLibrary.simpleMessage("LibGen Mobile est un projet FLOSS  (Free/Libre Open Source Software). Le développeur n’est aucunement associé à Library Genesis.\n\nPour l’instant, cette application ne procure un accès qu’à la partie Sci-Tech.\n\nLe dossier de destination pour les fichiers téléchargés est le dossier Téléchargements par défaut."),
    "searchBookScreenSearchBarHint" : MessageLookupByLibrary.simpleMessage("Chercher par titre, auteur ou ISBN"),
    "showFilterDialogApply" : MessageLookupByLibrary.simpleMessage("Appliquer"),
    "showFilterDialogCancel" : MessageLookupByLibrary.simpleMessage("Annuler"),
    "showFilterDialogSearchInLabel" : MessageLookupByLibrary.simpleMessage("Rechercher dans"),
    "showFilterDialogSortByLabel" : MessageLookupByLibrary.simpleMessage("Trier par"),
    "showFilterDialogTitle" : MessageLookupByLibrary.simpleMessage("Filtrer")
  };
}
