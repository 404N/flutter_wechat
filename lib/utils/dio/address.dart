class Address {
  static String host = "http://192.168.31.224:8081/";
  static String ws = "ws://192.168.31.224:8080";

  ///GET 按页获取笔记
  static String getNote(int size, int page) {
    return "api/article/$size/$page";
  }

  static String getBooks() {
    return "api/books";
  }

  static String login() {
    return "api/login";
  }

  static String queryUser() {
    return "api/queryUser";
  }

  static String addFriend() {
    return "api/addFriend";
  }
}
