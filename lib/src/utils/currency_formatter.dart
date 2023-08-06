import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'currency_formatter.g.dart';

@riverpod
NumberFormat currencyFormatter(CurrencyFormatterRef ref) {
  return NumberFormat.simpleCurrency(locale: "en_US");
}
