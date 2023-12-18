export 'validators/is_email_valid.dart';
export 'validators/is_not_empty.dart';
export 'validators/not_match.dart';

String? one(List<String? Function()> validators) {
  for (final validator in validators) {
    final error = validator();

    if (error != null) return error;
  }

  return null;
}

String? multi(List<String? Function()> validators) {
  final List<String> errors = [];

  for (final validator in validators) {
    final error = validator();
    if (error != null) errors.add(error);
  }

  return errors.isEmpty ? null : errors.join('\n');
}
