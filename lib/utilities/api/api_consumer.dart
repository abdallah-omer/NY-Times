abstract class ApiConsumer {
  Future<dynamic> get(String relativeURL, {Map<String, dynamic>? queryParameters});
}
