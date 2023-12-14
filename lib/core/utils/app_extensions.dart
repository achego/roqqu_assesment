import 'package:intl/intl.dart';

extension Doublex on double {
  String get formatMoney {
    return NumberFormat("#,##0.00", "en_US").format(this);
  }
}
