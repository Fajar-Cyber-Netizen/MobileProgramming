import 'package:flutter/material.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  bool minuman = false;
  bool makanan = false;
  List<String> menu = [];

  void updateMenu() {
    menu.clear();
    if (minuman) {
      menu.addAll(['Teh Manis', 'Kopi', 'Air Mineral']);
    }
    if (makanan) {
      menu.addAll(['Nasi Goreng', 'Kwetiau Goreng', 'Mie Tek-Tek']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text("Menu Restoranku", textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Card: Minuman
            cardCheckboxItem(
              label: 'Minuman',
              imagePath: 'images/minuman.png',
              value: minuman,
              onChanged: (value) {
                setState(() {
                  minuman = value!;
                  updateMenu();
                });
              },
            ),

            const SizedBox(height: 20),

            // Card: Makanan
            cardCheckboxItem(
              label: 'Makanan',
              imagePath: 'images/makanan.png',
              value: makanan,
              onChanged: (value) {
                setState(() {
                  makanan = value!;
                  updateMenu();
                });
              },
            ),

            const SizedBox(height: 30),

            const Text(
              'Menu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Menampilkan daftar menu
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                for (var item in menu)
                  Text(
                    '$item, ',
                    style: const TextStyle(fontSize: 16),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cardCheckboxItem({
    required String label,
    required String imagePath,
    required bool value,
    required Function(bool?) onChanged,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: SizedBox(
        width: 280,
        height: 70,
        child: Row(
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.lightBlueAccent,
              checkColor: Colors.black,
            ),
            const SizedBox(width: 8),
            Image.asset(imagePath, width: 40, height: 40),
            const SizedBox(width: 15),
            Text(label, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
