import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loginregister/pages/login_page.dart';

void main() {
  testWidgets('LoginPage renders and interacts correctly', (WidgetTester tester) async {
    // Render LoginPage
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
      ),
    );

    // Verifikasi teks "Welcome Back" muncul
    expect(find.text('Welcome Back'), findsOneWidget);

    // Cari field email dan password
    final emailField = find.byType(TextField).at(0);
    final passwordField = find.byType(TextField).at(1);

    // Masukkan teks ke email dan password
    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, '12345678');

    // Verifikasi bahwa teksnya benar
    expect(find.text('test@example.com'), findsOneWidget);
    expect(find.text('12345678'), findsOneWidget);

    // Tap tombol Login
    final loginButton = find.text('Login');
    expect(loginButton, findsOneWidget);
    await tester.tap(loginButton);

    // Trigger frame
    await tester.pump();

    // TODO: Tambahkan logika verifikasi login sukses saat ada navigasi
  });
}
