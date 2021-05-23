import 'package:flutter/foundation.dart' show describeEnum;

enum ReverseOrder { no, yes }

extension ReverseOrderExtension on ReverseOrder {
  String get name => describeEnum(this);

  bool get value {
    return this == ReverseOrder.yes;
  }
}
