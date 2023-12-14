import 'package:flutter_application_1/app/modules/service/api_service_posts.dart';
import 'package:flutter_application_1/app/modules/service/model_posts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([http.Client, ApiService])
void main() {
  late ApiService apiService;
  late MockClient mockClient;

  setUp(() {
    // Set up MockClient and ApiService for each test
    mockClient = MockClient();
    apiService = ApiService();
  });

  group('ApiService Tests Post', () {
    test(
      'fetchPosts returns a Posts object if the http call completes successfully',
      () async {
        // Arrange
        when(mockClient.get(any)).thenAnswer((_) async => http.Response(
              '{"userId": 1, "id": 1, "title": "Test Title", "body": "Test Body"}',
              200,
            ));

        // Act
        final result = await apiService.fetchPosts(mockClient);

        // Assert
        expect(result, isA<Posts>());
        expect(result.userId, 1);
        expect(result.id, 1);
        expect(result.title, 'Test Title');
        expect(result.body, 'Test Body');
      },
    );

    test(
      'fetchPosts throws an exception if the http call completes with an error',
      () async {
        // Arrange
        when(mockClient.get(any))
            .thenAnswer((_) async => http.Response('Not Found', 404));

        // Act and Assert
        expect(() => apiService.fetchPosts(mockClient), throwsException);
      },
    );

    // Add more test cases as needed
  });
}
