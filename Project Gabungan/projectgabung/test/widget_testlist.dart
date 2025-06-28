import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projectgabung/main.dart';

void main() {
  testWidgets('BottomNavigationBar test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Cek apakah halaman awal adalah Profile
    expect(find.text('Jhon Doe'), findsOneWidget);

    // Pindah ke halaman List
    await tester.tap(find.byIcon(Icons.list));
    await tester.pump();

    expect(find.text('List'), findsOneWidget);

    // Pindah ke halaman Pertemuan
    await tester.tap(find.byIcon(Icons.event));
    await tester.pump();

    expect(find.text('Pertemuan'), findsOneWidget);
  });
}
