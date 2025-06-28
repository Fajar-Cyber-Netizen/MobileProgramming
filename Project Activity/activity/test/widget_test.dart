import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:activity/main.dart'; 

void main() {
  testWidgets('Test Implicit Intent Buttons', (WidgetTester tester) async {
    // Memuat widget yang diuji
    await tester.pumpWidget(MyApp()); // Ganti MyApp dengan nama widget utama aplikasi kamu
    
    // Mengatur text field dengan link
    final textFieldFinder = find.byType(TextField);
    await tester.enterText(textFieldFinder, 'http://developer.android.com');
    
    // Menguji tombol "Open WebSite"
    final openWebsiteButton = find.text('OPEN WEBSITE');
    await tester.tap(openWebsiteButton);
    await tester.pumpAndSettle();
    
    // Periksa jika web browser terbuka dengan benar (diperlukan mock atau plugin testing)
    
    // Mengatur lokasi
    await tester.enterText(textFieldFinder, 'Golden Gate Bridge');
    
    // Menguji tombol "Open Location"
    final openLocationButton = find.text('OPEN LOCATION');
    await tester.tap(openLocationButton);
    await tester.pumpAndSettle();
    
    // Periksa jika lokasi terbuka dengan benar (diperlukan mock atau plugin testing)
    
    // Menguji tombol "Share This Text"
    await tester.enterText(textFieldFinder, 'Twis brigg and the slithy toves');
    final shareThisTextButton = find.text('SHARE THIS TEXT');
    await tester.tap(shareThisTextButton);
    await tester.pumpAndSettle();
    
    // Periksa apakah dialog share muncul (diperlukan mock atau plugin testing)
  });
}