import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const TriangleAreaCalculator(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key));

  // Fungsi untuk membuka website
  void _openWebsite() async {
    final Uri url = Uri.parse("http://developer.android.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {throw "Could not launch $url";
    
    }
  }
  
  // Fungsi untuk membuka lokasi (Google Maps)
  void _openLocation() async {
  final Uri url Uri.parse("geo:37.8199,-122.4783"); // Koordinat Golden Gate Bridge
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
  }
}

  // Fungsi untuk membagikan teks
  void _shareText() {
    Share.share("'Twas brillig and the slithy toves");
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Implicit Intents")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("http://developer.android.com"),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: _openWebsite,
              child: const Text("OPEN WEBSITE"), ), 
            ), // ElevatedButton
              const SizedBox(height: 20),
              const Text("Golden Gate Bridge"),
              const SizedBox(height: 5),
            ElevatedButton(
                onPressed: _openLocation,
                child: const Text("OPEN LOCATION"), ), 
            ), // ElevatedButton
              const SizedBox(height: 20),
              const Text("'Twas brillig and the slithy toves"),
              const SizedBox(height: 5),
            ElevatedButton(
                onPressed: _shareText,
                child: const Text("SHARE THIS TEXT"),
            ), // ElevatedButton
          ],
        ), // Column
      ), // Padding
    ); // Scaffold
  }
}
Page