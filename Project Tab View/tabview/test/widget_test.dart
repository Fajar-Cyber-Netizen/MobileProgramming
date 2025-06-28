import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tabview/main.dart';

void main() {
  testWidgets('Tab and BottomNavigation interaction test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Check initial screen
    expect(find.text('Selamat datang di Beranda!'), findsOneWidget);

    // Tap on Artikel tab using BottomNav
    await tester.tap(find.byIcon(Icons.article));
    await tester.pumpAndSettle();

    expect(find.text('Baca artikel menarik di sini.'), findsOneWidget);

    // Tap on Profil tab using TabBar
    await tester.tap(find.text('Profil'));
    await tester.pumpAndSettle();

    expect(find.text('Ini adalah halaman profil Anda.'), findsOneWidget);
  });
}
