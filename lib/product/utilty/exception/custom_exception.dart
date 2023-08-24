class FirebaseCustomException implements Exception {
  FirebaseCustomException(this.message);
  final String message;

  @override
  String toString() {
    return '$this $message';
  }
}
