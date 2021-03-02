class Address {
  static String host = "http://101.37.70.95:8080/";

  ///GET 按页获取笔记
  static String getNote(int size, int page) {
    return "api/article/$size/$page";
  }

  static String getBooks() {
    return "api/books";
  }
}
