import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Implicit Intents Example',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _shareController = TextEditingController();

  void _openWebsite() async {
    final url = _urlController.text;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openLocation() async {
    final location = _locationController.text;
    final url = 'https://www.google.com/maps/search/?api=1&query=$location';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _shareText() {
    final textToShare = _shareController.text; // Get the text from the input field
    if (textToShare.isNotEmpty) {
      Share.share(textToShare); // Use the user's input for sharing
    } else {
      // Optionally you can show a Snackbar or alert if the text is empty
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Intents Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _urlController,
              decoration: InputDecoration(labelText: 'Input URL'),
            ),
            ElevatedButton(
              onPressed: _openWebsite,
              child: Text('Open WebSite'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Input Location'),
            ),
            ElevatedButton(
              onPressed: _openLocation,
              child: Text('Open Location'),
            ),
            TextField(
              controller: _shareController,
              decoration: InputDecoration(labelText: 'Input Text to Share'),
            ),
            ElevatedButton(
              onPressed: _shareText,
              child: Text('Share This Text'),
            ),
          ],
        ),
      ),
    );
  }
}