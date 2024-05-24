extension DateTimeExt on DateTime {
  String toDMY({String splitter = "/"}) {
    return "${day.toString().padLeft(2, '0')}$splitter${month.toString().padLeft(2, '0')}$splitter${year.toString().padLeft(4, '0')}";
  }

  // DateFormat.yMMMd(tag).format(selected!)

  String toYyyyMmDd() {
    return "${year.toString().padLeft(4, '0')}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";
  }
}
