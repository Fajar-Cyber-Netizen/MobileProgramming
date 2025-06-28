import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:checkbox/page/checkbox_page.dart';
import 'package:checkbox/page/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> _page = [ProfilePage(), CheckboxPage()];
  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: _page[currentPage],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentPage,
          onTap: (i) => setState(() => currentPage = i),
          items: [
            // Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Profile"),
              selectedColor: Colors.blue,
            ),
            // Checkbox
            SalomonBottomBarItem(
              icon: Icon(Icons.check_box),
              title: Text("Checkbox"),
              selectedColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
