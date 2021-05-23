import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart' show describeEnum;

import 'package:libgen/generated/l10n.dart';

enum Extension { def, epub, mobi, azw, azw3, fb2, pdf, rtf, txt }

extension ExtensionExtension on Extension {
  String get name => describeEnum(this);

  String displayUILabel(BuildContext context) {
    switch (this) {
      case Extension.def:
        return S.of(context).filtersExtensionsAll;
        break;
      case Extension.epub:
        return S.of(context).filtersExtensionsEpub;
        break;
      case Extension.mobi:
        return S.of(context).filtersExtensionsMobi;
        break;
      case Extension.azw:
        return S.of(context).filtersExtensionsAzw;
        break;
      case Extension.azw3:
        return S.of(context).filtersExtensionsAzw3;
        break;
      case Extension.fb2:
        return S.of(context).filtersExtensionsFb2;
        break;
      case Extension.pdf:
        return S.of(context).filtersExtensionsPdf;
        break;
      case Extension.rtf:
        return S.of(context).filtersExtensionsRtf;
        break;
      case Extension.txt:
        return S.of(context).filtersExtensionsTxt;
        break;
      default:
        return S.of(context).filtersExtensionsAll;
    }
  }

  String get displayAPILabel {
    switch (this) {
      case Extension.def:
        return "def";
        break;
      case Extension.epub:
        return "epub";
        break;
      case Extension.mobi:
        return "mobi";
        break;
      case Extension.azw:
        return "azw";
        break;
      case Extension.azw3:
        return "azw3";
        break;
      case Extension.fb2:
        return "fb2";
        break;
      case Extension.pdf:
        return "pdf";
        break;
      case Extension.rtf:
        return "rtf";
        break;
      case Extension.txt:
        return "txt";
        break;
      default:
        return "def";
    }
  }
}
