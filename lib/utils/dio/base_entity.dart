class BaseEntity<T> {

  int code;
  String message;
  T result;

  BaseEntity(this.code, this.message, this.result);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'] ?? json['Code'];
    message = json['message'] ?? json['Message'];
    result = json['result'] ?? json['Result'];
  }
}