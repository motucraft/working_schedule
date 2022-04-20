class UnauthorizedException implements Exception {
  final String message;

  final Uri? uri;

  UnauthorizedException(this.message, [this.uri]);

  @override
  String toString() => message;
}
