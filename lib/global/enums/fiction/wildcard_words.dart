import 'package:flutter/foundation.dart' show describeEnum;

enum WildcardWords { no, yes }

extension WildcardWordsExtension on WildcardWords {
  String get name => describeEnum(this);

  bool get value {
    return this == WildcardWords.yes;
  }
}
