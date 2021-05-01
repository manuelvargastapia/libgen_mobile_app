import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart' show describeEnum;

import 'package:libgen/generated/l10n.dart';

enum Language {
  def,
  af,
  ar,
  as_,
  az,
  eu,
  be,
  bn,
  bs,
  br,
  bg,
  my,
  ca,
  zh,
  hr,
  cs,
  da,
  de,
  nl,
  en,
  eo,
  et,
  fo,
  fi,
  fr,
  gl,
  gr,
  el,
  gu,
  he,
  hi,
  hu,
  is_,
  id,
  ga,
  it,
  ja,
  ko,
  la,
  lv,
  lt,
  mk,
  ml,
  mr,
  ne,
  no,
  nb,
  oc,
  pa,
  fa,
  pl,
  pt,
  ro,
  ru,
  sc,
  sr,
  sk,
  es,
  su,
  sw,
  sv,
  tl,
  ty,
  ta,
  te,
  tn,
  tr,
  ot,
  tk,
  uk,
  ur,
  vi,
  yi,
}

extension LanguageExtension on Language {
  String get name => describeEnum(this);

  String displayUILabel(BuildContext context) {
    switch (this) {
      case Language.def:
        return S.of(context).filtersExtensionsAll;
        break;
      case Language.af:
        return "Afrikaans";
        break;
      case Language.ar:
        return "Arabic";
        break;
      case Language.as_:
        return "Assamese";
        break;
      case Language.az:
        return "Azerbaijani";
        break;
      case Language.eu:
        return "Basque";
        break;
      case Language.be:
        return "Belarusian (Trasianka)";
        break;
      case Language.bn:
        return "Bengali";
        break;
      case Language.bs:
        return "Bosnian";
        break;
      case Language.br:
        return "Breton";
        break;
      case Language.bg:
        return "Bulgarian";
        break;
      case Language.my:
        return "Burmese";
        break;
      case Language.ca:
        return "Catalan";
        break;
      case Language.zh:
        return "Chinese";
        break;
      case Language.hr:
        return "Croatian";
        break;
      case Language.cs:
        return "Czech";
        break;
      case Language.da:
        return "Danish";
        break;
      case Language.de:
        return "de";
        break;
      case Language.nl:
        return "Dutch";
        break;
      case Language.en:
        return "English";
        break;
      case Language.eo:
        return "Esperanto";
        break;
      case Language.et:
        return "Estonian";
        break;
      case Language.fo:
        return "Faroese";
        break;
      case Language.fi:
        return "Finnish";
        break;
      case Language.fr:
        return "French";
        break;
      case Language.gl:
        return "Galician";
        break;
      case Language.gr:
        return "Greek";
        break;
      case Language.el:
        return "Greek, Modern (1453-)";
        break;
      case Language.gu:
        return "Gujarati";
        break;
      case Language.he:
        return "Hebrew";
        break;
      case Language.hi:
        return "Hindi";
        break;
      case Language.hu:
        return "Hungarian";
        break;
      case Language.is_:
        return "Icelandic";
        break;
      case Language.id:
        return "Indonesian";
        break;
      case Language.ga:
        return "Irish";
        break;
      case Language.it:
        return "Italian";
        break;
      case Language.ja:
        return "Japanese";
        break;
      case Language.ko:
        return "Korean";
        break;
      case Language.la:
        return "Latin";
        break;
      case Language.lv:
        return "Latvian";
        break;
      case Language.lt:
        return "Lithuanian";
        break;
      case Language.mk:
        return "Macedonian";
        break;
      case Language.ml:
        return "Malayalam";
        break;
      case Language.mr:
        return "Marathi";
        break;
      case Language.ne:
        return "Nepali";
        break;
      case Language.no:
        return "Norwegian";
        break;
      case Language.nb:
        return "Norwegian Bokmål";
        break;
      case Language.oc:
        return "Occitan";
        break;
      case Language.pa:
        return "Panjabi";
        break;
      case Language.fa:
        return "Persian";
        break;
      case Language.pl:
        return "Polish";
        break;
      case Language.pt:
        return "Portuguese";
        break;
      case Language.ro:
        return "Romanian";
        break;
      case Language.ru:
        return "Russian";
        break;
      case Language.sc:
        return "Sardinian";
        break;
      case Language.sr:
        return "Serbian";
        break;
      case Language.sk:
        return "Slovak";
        break;
      case Language.es:
        return "Spanish";
        break;
      case Language.su:
        return "Sunda";
        break;
      case Language.sw:
        return "Swahili";
        break;
      case Language.sv:
        return "Swedish";
        break;
      case Language.tl:
        return "Tagalog";
        break;
      case Language.ty:
        return "Tahitian";
        break;
      case Language.ta:
        return "Tamil";
        break;
      case Language.te:
        return "Telugu";
        break;
      case Language.tn:
        return "Tswana";
        break;
      case Language.tr:
        return "Turkish";
        break;
      case Language.ot:
        return "Turkish, Ottoman (1500-1928)";
        break;
      case Language.tk:
        return "Turkmen";
        break;
      case Language.uk:
        return "Ukrainian";
        break;
      case Language.ur:
        return "Urdu";
        break;
      case Language.vi:
        return "Vietnamese";
        break;
      case Language.yi:
        return "Yiddish, English";
        break;
      default:
        return S.of(context).filtersExtensionsAll;
    }
  }

  String get displayAPILabel {
    switch (this) {
      case Language.def:
        return "def";
        break;
      case Language.af:
        return "Afrikaans";
        break;
      case Language.ar:
        return "Arabic";
        break;
      case Language.as_:
        return "Assamese";
        break;
      case Language.az:
        return "Azerbaijani";
        break;
      case Language.eu:
        return "Basque";
        break;
      case Language.be:
        return "Belarusian (Trasianka)";
        break;
      case Language.bn:
        return "Bengali";
        break;
      case Language.bs:
        return "Bosnian";
        break;
      case Language.br:
        return "Breton";
        break;
      case Language.bg:
        return "Bulgarian";
        break;
      case Language.my:
        return "Burmese";
        break;
      case Language.ca:
        return "Catalan";
        break;
      case Language.zh:
        return "Chinese";
        break;
      case Language.hr:
        return "Croatian";
        break;
      case Language.cs:
        return "Czech";
        break;
      case Language.da:
        return "Danish";
        break;
      case Language.de:
        return "de";
        break;
      case Language.nl:
        return "Dutch";
        break;
      case Language.en:
        return "English";
        break;
      case Language.eo:
        return "Esperanto";
        break;
      case Language.et:
        return "Estonian";
        break;
      case Language.fo:
        return "Faroese";
        break;
      case Language.fi:
        return "Finnish";
        break;
      case Language.fr:
        return "French";
        break;
      case Language.gl:
        return "Galician";
        break;
      case Language.gr:
        return "Greek";
        break;
      case Language.el:
        return "Greek, Modern (1453-)";
        break;
      case Language.gu:
        return "Gujarati";
        break;
      case Language.he:
        return "Hebrew";
        break;
      case Language.hi:
        return "Hindi";
        break;
      case Language.hu:
        return "Hungarian";
        break;
      case Language.is_:
        return "Icelandic";
        break;
      case Language.id:
        return "Indonesian";
        break;
      case Language.ga:
        return "Irish";
        break;
      case Language.it:
        return "Italian";
        break;
      case Language.ja:
        return "Japanese";
        break;
      case Language.ko:
        return "Korean";
        break;
      case Language.la:
        return "Latin";
        break;
      case Language.lv:
        return "Latvian";
        break;
      case Language.lt:
        return "Lithuanian";
        break;
      case Language.mk:
        return "Macedonian";
        break;
      case Language.ml:
        return "Malayalam";
        break;
      case Language.mr:
        return "Marathi";
        break;
      case Language.ne:
        return "Nepali";
        break;
      case Language.no:
        return "Norwegian";
        break;
      case Language.nb:
        return "Norwegian Bokmål";
        break;
      case Language.oc:
        return "Occitan";
        break;
      case Language.pa:
        return "Panjabi";
        break;
      case Language.fa:
        return "Persian";
        break;
      case Language.pl:
        return "Polish";
        break;
      case Language.pt:
        return "Portuguese";
        break;
      case Language.ro:
        return "Romanian";
        break;
      case Language.ru:
        return "Russian";
        break;
      case Language.sc:
        return "Sardinian";
        break;
      case Language.sr:
        return "Serbian";
        break;
      case Language.sk:
        return "Slovak";
        break;
      case Language.es:
        return "Spanish";
        break;
      case Language.su:
        return "Sunda";
        break;
      case Language.sw:
        return "Swahili";
        break;
      case Language.sv:
        return "Swedish";
        break;
      case Language.tl:
        return "Tagalog";
        break;
      case Language.ty:
        return "Tahitian";
        break;
      case Language.ta:
        return "Tamil";
        break;
      case Language.te:
        return "Telugu";
        break;
      case Language.tn:
        return "Tswana";
        break;
      case Language.tr:
        return "Turkish";
        break;
      case Language.ot:
        return "Turkish, Ottoman (1500-1928)";
        break;
      case Language.tk:
        return "Turkmen";
        break;
      case Language.uk:
        return "Ukrainian";
        break;
      case Language.ur:
        return "Urdu";
        break;
      case Language.vi:
        return "Vietnamese";
        break;
      case Language.yi:
        return "Yiddish, English";
        break;
      default:
        return "def";
    }
  }
}
