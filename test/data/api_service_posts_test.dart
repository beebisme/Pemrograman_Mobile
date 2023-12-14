import 'package:flutter_application_1/app/modules/service/api_service_posts.dart';
import 'package:flutter_application_1/app/modules/service/model_posts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('ApiService Tests', () {
    test(
        'fetchPosts returns a Posts object if the http call completes successfully',
        () async {
      // Arrange
      final apiService = ApiService();
      final client = http.Client();

      // Act
      final result = await apiService.fetchPosts(client);

      // Assert
      expect(result, isA<Posts>());
      expect(result.userId, isNotNull);
      expect(result.id, isNotNull);
      expect(result.title, isNotNull);
      expect(result.body, isNotNull);
    });

    test(
        'fetchPosts throws an exception if the http call completes with an error',
        () async {
      // Arrange
      final apiService = ApiService();
      final client = MockClient((request) async {
        return http.Response('Not Found', 404);
      });

      // Act
      final call = apiService.fetchPosts(client);

      // Assert
      expect(call, throwsException);
    });

    // Add more test cases as needed
  });
}
