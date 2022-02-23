///
/// Created by Abduraimbek Yarkinov at 18:32 on 08.12.2021.
///

import 'package:currency_text_input_formatter/'
    'currency_text_input_formatter.dart';
import 'package:flutter/services.dart';

class MyInputFormatters {
  static final decimalInputFormatter =
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'));

  static final currencyInputFormatter = CurrencyTextInputFormatter(
    decimalDigits: 0,
    symbol: "",
  );
}
