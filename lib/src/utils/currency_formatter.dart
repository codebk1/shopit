import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:intl/intl.dart';

part 'currency_formatter.g.dart';

@riverpod
NumberFormat currencyFormatter(CurrencyFormatterRef ref) {
  return NumberFormat.simpleCurrency(locale: "en_US");
}
