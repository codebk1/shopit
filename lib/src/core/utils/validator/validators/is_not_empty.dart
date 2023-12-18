String? isNotEmpty(String? value, String errorMessage) {
  return value!.trim().isEmpty ? errorMessage : null;
}
