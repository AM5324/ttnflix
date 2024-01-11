class ResponseModel<T> {
  final String? message;
  final int? code;
  final T? body;

  const ResponseModel({
    required this.body,
    this.message,
    required this.code,
  });

  factory ResponseModel.fromJson(JSON? json) {
    return ResponseModel(
      body: json?['data'] as T,
      message: json?['status_message'] as String?,
      code: json?['status_code'] as int,
    );
  }
}

typedef JSON = Map<String, dynamic>;
typedef QueryParams = Map<String, String>;
