extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

String padWith0s(int number) {
  if (number < 10) {
    return "00${number}";
  } else if (number < 100) {
    return "0${number}";
  } else {
    return "${number}";
  }
}
