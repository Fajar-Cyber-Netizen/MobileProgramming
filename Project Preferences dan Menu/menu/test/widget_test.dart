import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:menu/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({}); // Mock kosong untuk test awal
  });

  testWidgets('Menampilkan halaman utama dan menu drawer', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Memastikan teks utama muncul
    expect(find.text('Selamat datang di halaman utama!'), findsOneWidget);

    // Buka drawer
    final scaffoldState = tester.state<ScaffoldState>(find.byType(Scaffold));
    scaffoldState.openDrawer();
    await tester.pumpAndSettle();

    // Pastikan ada item "Preferences"
    expect(find.text('Preferences'), findsOneWidget);
  });

  testWidgets('Navigasi ke halaman Preferences dan toggle dark mode', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Buka drawer
    final scaffoldState = tester.state<ScaffoldState>(find.byType(Scaffold));
    scaffoldState.openDrawer();
    await tester.pumpAndSettle();

    // Tap pada "Preferences"
    await tester.tap(find.text('Preferences'));
    await tester.pumpAndSettle();

    // Pastikan halaman Preferences terbuka
    expect(find.text('Dark Mode'), findsOneWidget);

    // Toggle switch dark mode
    await tester.tap(find.byType(SwitchListTile));
    await tester.pumpAndSettle();

    // Pastikan switch berubah nilai (opsional jika diuji lebih dalam)
    final switchTile = tester.widget<SwitchListTile>(find.byType(SwitchListTile));
    expect(switchTile.value, true); // Seharusnya true setelah toggle
  });
}
