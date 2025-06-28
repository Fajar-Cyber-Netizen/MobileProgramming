import 'dart:io';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final String imagePath;

  const TestPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Foto'),
      ),
      body: Center(
        child: imagePath.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.file(File(imagePath)),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Kembali'),
                  )
                ],
              )
            : const Text('Tidak ada gambar tersedia'),
      ),
    );
  }
}
