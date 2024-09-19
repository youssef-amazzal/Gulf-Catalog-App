class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}

class ClientException implements Exception {
  final String message;

  ClientException({required this.message});
}
