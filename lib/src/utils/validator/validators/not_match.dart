String? notMatch(String? value1, String? value2, String errorMessage) {
  return value1!.trim() != value2!.trim() ? errorMessage : null;
}
