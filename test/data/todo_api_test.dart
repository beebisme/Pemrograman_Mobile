import 'package:flutter_application_1/app/modules/controllers/api_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('ApiService Tests', () {
    test(
        'fetchTodo returns a Todos object if the http call completes successfully',
        () async {
      // Arrange
      final apiService = ApiController();
      final client = http.Client();

      // Act
      final result = await apiService.fetchTodo(client);

      // Assert
      expect(result, isA<Todo>());
    });

    test(
        'fetchTodo throws an exception if the http call completes with an error',
        () async {
      // Arrange
      final apiService = ApiController();
      final client = MockClient((request) async {
        return http.Response('Not Found', 404);
      });

      // Act
      final call = apiService.fetchTodo(client);

      // Assert
      expect(call, throwsException);
    });

    // Add more test cases as needed
  });
}
