extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this);
  }

  double toDouble() {
    final val = double.tryParse(replaceAll(",", ""));
    return val ?? 0;
  }

  String get capitalize => "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  String get capitalizeFirstofEach => split(" ").map((str) => str.capitalize).join(" ");
}
