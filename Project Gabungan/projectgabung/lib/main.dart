import 'package:flutter/material.dart';
import 'package:projectgabung/page/autocomplete_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:projectgabung/page/checkbox_page.dart';
import 'package:projectgabung/page/profile_page.dart';
import 'package:projectgabung/page/intent_page.dart';
import 'package:projectgabung/page/tab_page.dart';
import 'package:projectgabung/page/alert_page.dart';
import 'package:projectgabung/model/list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentPage = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      ProfilePage(),
      IntentPage(),
      ToastAndAlertScreen(),
      MyTabPage(),
      ListPage(),
      CheckboxPage(),
      AutocompletePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: IndexedStack(
          index: currentPage,
          children: _pages,
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentPage,
          onTap: (i) => setState(() => currentPage = i),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.blue,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.flash_on),
              title: Text("Activity"),
              selectedColor: Colors.blue,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.notifications_active),
              title: Text("Alert"),
              selectedColor: Colors.blue,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.tab),
              title: Text("Tab"),
              selectedColor: Colors.blue,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.list),
              title: Text("List"),
              selectedColor: Colors.blue,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.check_box),
              title: Text("CheckBox"),
              selectedColor: Colors.blue,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
              selectedColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
