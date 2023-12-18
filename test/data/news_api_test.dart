import 'package:flutter_application_1/app/model/news_model.dart';
import 'package:flutter_application_1/app/modules/controllers/news_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('ApiService Tests', () {
    test(
        'fetchNews returns a News object if the http call completes successfully',
        () async {
      // Arrange
      final apiService = NewsController();
      final client = http.Client();

      // Act
      final result = await apiService.fetchNews(client);

      // Assert
      expect(result, isA<News>());
    });

    test(
        'fetchNews throws an exception if the http call completes with an error',
        () async {
      // Arrange
      final apiService = NewsController();
      final client = MockClient((request) async {
        return http.Response('Not Found', 404);
      });

      // Act
      final call = apiService.fetchNews(client);

      // Assert
      expect(call, throwsException);
    });

    // Add more test cases as needed
  });
}
