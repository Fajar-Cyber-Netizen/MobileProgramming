import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class IntentPage extends StatelessWidget {
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _shareController = TextEditingController();

  void _openWebsite() async {
    final url = _urlController.text;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openLocation() async {
    final location = _locationController.text;
    final url = 'https://www.google.com/maps/search/?api=1&query=$location';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  void _shareText() {
    final textToShare = _shareController.text;
    if (textToShare.isNotEmpty) {
      Share.share(textToShare);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Implicit Intents')),
      body: Container(
        // Background color for the entire page
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.pink.shade200], // Gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _buildInputCard('Open Website', _urlController, 'Enter URL', _openWebsite, 'Open', Icons.open_in_browser),
              _buildInputCard('Open Location', _locationController, 'Enter Location', _openLocation, 'Open', Icons.map),
              _buildInputCard('Share Text', _shareController, 'Enter text to share', _shareText, 'Share', Icons.share),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputCard(
    String title,
    TextEditingController controller,
    String hint,
    VoidCallback onPressed,
    String buttonText,
    IconData icon,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon),
              label: Text(buttonText),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                textStyle: TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
