import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projectgabung/page/autocomplete_page.dart';

void main() {
  testWidgets('Test tombol submit berubah menjadi ikon dan kembali', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AutocompletePage(),
      ),
    );

    // Verifikasi tombol "Submit" tampil
    expect(find.text('Submit'), findsOneWidget);

    // Tap tombol "Submit"
    await tester.tap(find.byType(OutlinedButton));
    await tester.pump(); // mulai animasi

    // Tunggu animasi loading 3 detik
    await tester.pump(const Duration(seconds: 3));

    // Verifikasi ikon done muncul
    expect(find.byIcon(Icons.done), findsOneWidget);

    // Tunggu reset tombol 3 detik
    await tester.pump(const Duration(seconds: 3));

    // Verifikasi tombol kembali ke "Submit"
    expect(find.text('Submit'), findsOneWidget);
  });

  testWidgets('Pencarian menampilkan hasil saran', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AutocompletePage()));

    // Tap tombol search
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    // Masukkan kata kunci
    await tester.enterText(find.byType(TextField), 'java');
    await tester.pump();

    // Verifikasi saran muncul
    expect(find.text('Java'), findsWidgets);
  });
}
