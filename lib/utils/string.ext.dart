extension StringExt on String {
  double getDefaultDouble(num def) {
    double value = isNotEmpty && int.tryParse(this) != null
        ? int.parse(this).toDouble()
        : def.toDouble();
    return value;
  }

  String maxSubString(int max, [bool addDots = false]) {
    if (length > max) {
      String s = substring(0, max);
      if (addDots) s += "...";
      return s;
    }
    return this;
  }
}
