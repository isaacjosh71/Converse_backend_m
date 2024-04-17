class AppException implements Exception {
  /// Creates a new instance of [AppException]
  AppException({
    this.message,
    this.code,
  });

  /// Exception message
  final String? message;

  /// Exception http response code
  final int? code;
}
