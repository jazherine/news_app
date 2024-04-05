class FirebaseCustomException implements Exception {
  FirebaseCustomException(this.description);

  final String description;

  @override
  String toString() {
    // TODO: implement toString
    return '$this FirebaseException: $description';
  }
}

class VersionCustomException implements Exception {
  VersionCustomException(this.description);

  final String description;

  @override
  String toString() {
    // TODO: implement toString
    return '$this FirebaseException: $description';
  }
}
