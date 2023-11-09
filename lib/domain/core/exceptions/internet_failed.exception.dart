import 'package:logger/logger.dart';

class InternetFailedException implements Exception {
  final String message;

  InternetFailedException({
    this.message = 'Failed to connect to the server!',
  }) {
    Logger().w(message);
  }

  @override
  String toString() => message;
}