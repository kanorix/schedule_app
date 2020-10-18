class Validator {
  Validator._();

  static bool isDate(String value) {
    const _regExpString = r'^[0-9]{4}\/[0-9]{2}\/[0-9]{2}$';
    return value.isNotEmpty &&
        RegExp(_regExpString, caseSensitive: true).hasMatch(value);
  }
}
