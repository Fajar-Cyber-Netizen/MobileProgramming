import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(ToastAndAlertApp());
}

class ToastAndAlertApp extends StatelessWidget {
  const ToastAndAlertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Toast and Alert",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: ToastAndAlertScreen(),
    );
  }
}

class ToastAndAlertScreen extends StatefulWidget {
  const ToastAndAlertScreen({super.key});

  @override
  State<ToastAndAlertScreen> createState() => _ToastAndAlertScreenState();
}

class _ToastAndAlertScreenState extends State<ToastAndAlertScreen> {
  final TextEditingController _controller = TextEditingController();

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.notifications_active, color: Colors.teal),
            SizedBox(width: 10),
            Text("Konfirmasi"),
          ],
        ),
        content: Text("Kamu yakin ingin menampilkan notifikasi?"),
        actions: [
          TextButton(
            child: Text("Batal"),
            onPressed: () => Navigator.pop(context),
          ),
          FilledButton(
            child: Text("Ya"),
            onPressed: () {
              Navigator.pop(context);
              _showToastMessage();
            },
          ),
        ],
      ),
    );
  }

  void _showToastMessage() {
    final msg = _controller.text.trim();
    Fluttertoast.showToast(
      msg: msg.isNotEmpty ? msg : "🔔 Default Notifikasi",
      backgroundColor: Colors.teal[700],
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG, // Lebih lama dari SHORT
      timeInSecForIosWeb: 5, // durasi toast untuk iOS/Web (jika applicable)
      fontSize: 16,
    );
  }

  void _showReminderSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("⏳ Pengingat akan muncul dalam 5 detik..."),
        backgroundColor: Colors.teal,
        duration: Duration(seconds: 5),
      ),
    );

    Future.delayed(Duration(seconds: 5), () {
      Fluttertoast.showToast(
        msg: "⏰ Ini pengingat kamu!",
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        gravity: ToastGravity.TOP,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 6,
        fontSize: 16,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toast and Alert"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Tulis pesan...",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.edit_note),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _showConfirmationDialog,
                    icon: Icon(Icons.send),
                    label: Text("Kirim"),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _showReminderSnackbar,
                    icon: Icon(Icons.alarm),
                    label: Text("Pengingat"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
