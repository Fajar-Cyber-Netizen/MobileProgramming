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
      menu.addAll(['Cantik', 'Lucu', 'Gemesh']);
    }
    if (makanan) {
      menu.addAll(['Imut', 'Embul', 'Sempurna']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menggunakan NetworkImage untuk latar belakang
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1518199266791-5375a83190b7?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Ganti dengan URL gambar yang diinginkan
            fit: BoxFit.cover, // Menyesuaikan gambar dengan layar
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60),

              // Card: Minuman
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: cardCheckboxItem(
                  label: 'RIVA',
                  imagePath: 'images/ivaa.jpg',
                  value: minuman,
                  onChanged: (value) {
                    setState(() {
                      minuman = value!;
                      updateMenu();
                    });
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Card: Makanan
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: cardCheckboxItem(
                  label: 'OKTA',
                  imagePath: 'images/iva.jpg',
                  value: makanan,
                  onChanged: (value) {
                    setState(() {
                      makanan = value!;
                      updateMenu();
                    });
                  },
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'ORANGNYA :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Menampilkan daftar menu dengan animasi
              AnimatedOpacity(
                opacity: menu.isEmpty ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 500),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    for (var item in menu)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Chip(
                          label: Text(item, style: const TextStyle(fontSize: 16)),
                          backgroundColor: Colors.pinkAccent,
                          elevation: 5,
                          shadowColor: Colors.black45,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
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
      elevation: 10,
      shadowColor: Colors.black26,
      child: SizedBox(
        width: 280,
        height: 100,
        child: Row(
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.pinkAccent,
              checkColor: Colors.white,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            const SizedBox(width: 8),
            Image.asset(imagePath, width: 80, height: 80),
            const SizedBox(width: 15),
            Text(label, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
