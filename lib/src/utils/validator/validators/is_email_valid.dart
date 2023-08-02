String? isEmailValid(String? value, String errorMessage) {
  final regExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  return regExp.hasMatch(value!) ? null : errorMessage;
}
