import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/widget_testing/LoginPage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/main.dart'; // Ganti dengan nama proyek Anda

void main() {
  testWidgets('LoginPage UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester
        .pumpWidget(LoginPage()); // Ganti dengan class utama aplikasi Anda

    // Find the text fields and buttons
    final emailTextField = find.byType(TextField).at(0);
    final passwordTextField = find.byType(TextField).at(1);
    final loginButton = find.byType(ElevatedButton);

    // Enter text into the text fields
    await tester.enterText(emailTextField, 'test@example.com');
    await tester.enterText(passwordTextField, 'password123');

    // Tap the login button
    await tester.tap(loginButton);

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // Expect that the email and password text fields have the entered text
    expect(find.text('test@example.com'), findsOneWidget);
    expect(find.text('password123'), findsOneWidget);

    // You can add more expectations based on your specific UI
  });
}
