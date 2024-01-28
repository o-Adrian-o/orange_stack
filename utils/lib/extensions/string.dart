extension StringExtension on String? {
  String orEmpty() {
    return this ?? '';
  }
}