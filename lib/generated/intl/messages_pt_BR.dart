// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt_BR locale. All the
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
  String get localeName => 'pt_BR';

  static m0(author) => "por ${author}";

  static m1(author) => "por ${author}";

  static m2(megabytes, kilobytes) => "${megabytes} MB (${kilobytes} KB)";

  static m3(searchTerm) => "Nenhum resultado para \"${searchTerm}\"";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "bookDetailsPresenterByAuthor" : m0,
    "bookDetailsPresenterDescription" : MessageLookupByLibrary.simpleMessage("Descrição"),
    "bookDetailsPresenterInfo" : MessageLookupByLibrary.simpleMessage("Informações"),
    "bookDetailsPresenterNoTitle" : MessageLookupByLibrary.simpleMessage("(sem título)"),
    "bookDetailsPresenterTOC" : MessageLookupByLibrary.simpleMessage("Tabela de conteúdo"),
    "bookListItemByAuthor" : m1,
    "bookListItemNoTitle" : MessageLookupByLibrary.simpleMessage("(sem título)"),
    "downloadButtonCancel" : MessageLookupByLibrary.simpleMessage("Cancelar"),
    "downloadButtonConnectionFailedErrorMessage" : MessageLookupByLibrary.simpleMessage("Erro de rede. Por favor, cheque sua conexão com à internet"),
    "downloadButtonDefaultExtension" : MessageLookupByLibrary.simpleMessage("TXT"),
    "downloadButtonDownloadFromBrowser" : MessageLookupByLibrary.simpleMessage("Este arquivo é massivo! Por favor, use o navegador para baixá-lo"),
    "downloadButtonGenericErrorMessage" : MessageLookupByLibrary.simpleMessage("Erro no download. Por favor, tente novamente mais tarde."),
    "downloadButtonLargeFile" : MessageLookupByLibrary.simpleMessage("Arquivo grande"),
    "downloadButtonOpenBrowser" : MessageLookupByLibrary.simpleMessage("Abrir navegador"),
    "downloadButtonOpenSettings" : MessageLookupByLibrary.simpleMessage("Abrir configurações"),
    "downloadButtonPermissionsDenied" : MessageLookupByLibrary.simpleMessage("Permissões negadas"),
    "downloadButtonProvidePermissions" : MessageLookupByLibrary.simpleMessage("Por favor, forneça as permissões através das configurações do app"),
    "downloadButtonStartingDownloadMessage" : MessageLookupByLibrary.simpleMessage("Iniciando download"),
    "expandableTextShowLess" : MessageLookupByLibrary.simpleMessage("Mostrar menos"),
    "expandableTextShowMore" : MessageLookupByLibrary.simpleMessage("Mostrar mais"),
    "filtersExtensionsAll" : MessageLookupByLibrary.simpleMessage("Tudo"),
    "filtersExtensionsAscending" : MessageLookupByLibrary.simpleMessage("Ascendente"),
    "filtersExtensionsAuthor" : MessageLookupByLibrary.simpleMessage("Autor"),
    "filtersExtensionsBiggerFirst" : MessageLookupByLibrary.simpleMessage("Grandes primeiro"),
    "filtersExtensionsDescending" : MessageLookupByLibrary.simpleMessage("Descendente"),
    "filtersExtensionsFileSize" : MessageLookupByLibrary.simpleMessage("Tamanho do arquivo"),
    "filtersExtensionsISBN" : MessageLookupByLibrary.simpleMessage("ISBN"),
    "filtersExtensionsLargerFirst" : MessageLookupByLibrary.simpleMessage("Largos primeiro"),
    "filtersExtensionsMD5" : MessageLookupByLibrary.simpleMessage("MD5"),
    "filtersExtensionsNewerFirst" : MessageLookupByLibrary.simpleMessage("Recentes primeiro"),
    "filtersExtensionsOlderFirst" : MessageLookupByLibrary.simpleMessage("Antigos primeiro"),
    "filtersExtensionsPages" : MessageLookupByLibrary.simpleMessage("Páginas"),
    "filtersExtensionsPublisher" : MessageLookupByLibrary.simpleMessage("Editora"),
    "filtersExtensionsRelevance" : MessageLookupByLibrary.simpleMessage("Relevância"),
    "filtersExtensionsSeries" : MessageLookupByLibrary.simpleMessage("Série"),
    "filtersExtensionsShorterFirst" : MessageLookupByLibrary.simpleMessage("Curtos primeiro"),
    "filtersExtensionsSmallerFirst" : MessageLookupByLibrary.simpleMessage("Pequenos primeiro"),
    "filtersExtensionsTitle" : MessageLookupByLibrary.simpleMessage("Título"),
    "filtersExtensionsYear" : MessageLookupByLibrary.simpleMessage("Ano"),
    "infoDialogAlertDialogRightButtonText" : MessageLookupByLibrary.simpleMessage("Fechar"),
    "infoTableAuthor" : MessageLookupByLibrary.simpleMessage("Autor(es):"),
    "infoTableCity" : MessageLookupByLibrary.simpleMessage("Cidade:"),
    "infoTableDOI" : MessageLookupByLibrary.simpleMessage("DOI:"),
    "infoTableEdition" : MessageLookupByLibrary.simpleMessage("Edição:"),
    "infoTableFileExtension" : MessageLookupByLibrary.simpleMessage("Extensão do arquivo:"),
    "infoTableFileSize" : MessageLookupByLibrary.simpleMessage("Tamanho do arquivo"),
    "infoTableFileSizeMessage" : m2,
    "infoTableISBN" : MessageLookupByLibrary.simpleMessage("ISBN(s):"),
    "infoTableLanguage" : MessageLookupByLibrary.simpleMessage("Idioma:"),
    "infoTablePages" : MessageLookupByLibrary.simpleMessage("Páginas:"),
    "infoTablePublisher" : MessageLookupByLibrary.simpleMessage("Editora:"),
    "infoTableSeries" : MessageLookupByLibrary.simpleMessage("Série:"),
    "infoTableTitle" : MessageLookupByLibrary.simpleMessage("Título:"),
    "infoTableVolume" : MessageLookupByLibrary.simpleMessage("Volume:"),
    "infoTableYear" : MessageLookupByLibrary.simpleMessage("Ano:"),
    "resultsBuilderConnectionFailedErrorMessage" : MessageLookupByLibrary.simpleMessage("Erro de rede.\nPor favor, cheque sua conexão com à internet"),
    "resultsBuilderGenericErrorMessage" : MessageLookupByLibrary.simpleMessage("Ops! Nós estragamos tudo.\nPor favor, tente novamente mais tarde."),
    "resultsBuilderNoMoreResultsMessage" : MessageLookupByLibrary.simpleMessage("Não há mais resultados!"),
    "resultsBuilderNoResultsForSearchTermMessage" : m3,
    "resultsBuilderTotalResultsCounterMessage" : MessageLookupByLibrary.simpleMessage(" resultados"),
    "searchBookDelegateSearchFieldLabel" : MessageLookupByLibrary.simpleMessage("Título, autor ou ISBN"),
    "searchBookScreenAboutFloatingButtomTitle" : MessageLookupByLibrary.simpleMessage("Sobre"),
    "searchBookScreenApplicationLegalese" : MessageLookupByLibrary.simpleMessage("LibGen Mobile é um projeto FLOSS (Free/Libre Open Source Software).\n\nPor enquanto, este app somente fornece acesso a seção Sci-Tech.\n\nÀ pasta de destino para os arquivos baixados é o diretório padrão de Downloads."),
    "searchBookScreenSearchBarHint" : MessageLookupByLibrary.simpleMessage("Pesquise por título, autor ou ISBN"),
    "showFilterDialogApply" : MessageLookupByLibrary.simpleMessage("Aplicar"),
    "showFilterDialogCancel" : MessageLookupByLibrary.simpleMessage("Cancelar"),
    "showFilterDialogSearchInLabel" : MessageLookupByLibrary.simpleMessage("Pesquisar em"),
    "showFilterDialogSortByLabel" : MessageLookupByLibrary.simpleMessage("Ordenar por"),
    "showFilterDialogTitle" : MessageLookupByLibrary.simpleMessage("Filtro")
  };
}
