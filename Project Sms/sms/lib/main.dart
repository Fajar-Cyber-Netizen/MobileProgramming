import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: kIsWeb ? const DummySmsPage() : SmsHomePage(telephony: Telephony.instance),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ======================== ANDROID SMS PAGE ========================

class SmsHomePage extends StatefulWidget {
  final Telephony telephony;
  const SmsHomePage({Key? key, required this.telephony}) : super(key: key);

  @override
  _SmsHomePageState createState() => _SmsHomePageState();
}

class _SmsHomePageState extends State<SmsHomePage> {
  String latestSms = "Belum ada SMS masuk.";

  @override
  void initState() {
    super.initState();
    _requestPermission();
    _listenToIncomingSms();
  }

  void _requestPermission() async {
    final isGranted = await widget.telephony.requestPhoneAndSmsPermissions;
    if (isGranted == true) {
      print("Izin SMS diberikan.");
    } else {
      print("Izin SMS ditolak.");
    }
  }

  void _listenToIncomingSms() {
    widget.telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        setState(() {
          latestSms = "Dari: ${message.address}\nPesan: ${message.body}";
        });
      },
      onBackgroundMessage: _backgroundSmsHandler,
    );
  }

  static void _backgroundSmsHandler(SmsMessage message) {
    print("SMS diterima di background: ${message.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SMS Listener (Android)")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            latestSms,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

// ======================== DUMMY PAGE FOR WEB ========================

class DummySmsPage extends StatefulWidget {
  const DummySmsPage({super.key});

  @override
  State<DummySmsPage> createState() => _DummySmsPageState();
}

class _DummySmsPageState extends State<DummySmsPage> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final List<String> smsList = [];

  void simulateSms() {
    String sender = _numberController.text.trim();
    String message = _messageController.text.trim();

    if (sender.isEmpty || message.isEmpty) return;

    setState(() {
      smsList.insert(0, "Dari: $sender\nPesan: $message");
      _numberController.clear();
      _messageController.clear();
    });
  }

  void clearInbox() {
    setState(() {
      smsList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SMS Simulator (Web)"),
        actions: [
          IconButton(
            onPressed: clearInbox,
            icon: const Icon(Icons.delete),
            tooltip: "Hapus Semua SMS",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _numberController,
              decoration: const InputDecoration(
                labelText: "Nomor Pengirim",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                labelText: "Isi Pesan",
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: simulateSms,
              child: const Text("Kirim Simulasi SMS Masuk"),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const Text(
              "Kotak Masuk SMS:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: smsList.isEmpty
                  ? const Center(child: Text("Belum ada SMS masuk."))
                  : ListView.builder(
                      itemCount: smsList.length,
                      itemBuilder: (context, index) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(smsList[index]),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
