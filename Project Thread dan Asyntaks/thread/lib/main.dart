import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Async Thread Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AsyncExamplePage(),
    );
  }
}

class AsyncExamplePage extends StatefulWidget {
  const AsyncExamplePage({super.key});

  @override
  State<AsyncExamplePage> createState() => _AsyncExamplePageState();
}

class _AsyncExamplePageState extends State<AsyncExamplePage> {
  String _status = "Menunggu...";

  // Fungsi asinkronus (simulasi thread menggunakan Future)
  Future<void> _startLongProcess() async {
    setState(() {
      _status = "Memproses...";
    });

    // Simulasi proses berat (misal ambil data dari internet, dll)
    await Future.delayed(const Duration(seconds: 3)); // simulasi 3 detik

    setState(() {
      _status = "Selesai!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thread & Async Flutter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_status, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startLongProcess,
              child: const Text("Mulai Proses Async"),
            ),
          ],
        ),
      ),
    );
  }
}
