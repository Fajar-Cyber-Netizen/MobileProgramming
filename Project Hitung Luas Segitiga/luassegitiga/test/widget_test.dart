import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/main.dart';

void main() {
  testWidgets('Menghitung luas segitiga dengan benar', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TriangleAreaCalculator()));

    // Masukkan nilai untuk alas dan tinggi
    await tester.enterText(find.byType(TextField).at(0), '6');
    await tester.enterText(find.byType(TextField).at(1), '5');

    // Tekan tombol hitung
    await tester.tap(find.text('HITUNG'));
    await tester.pump();

    // Cek hasil yang ditampilkan
    expect(find.text('Luas: 15.00'), findsOneWidget);
  });
}
