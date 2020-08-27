import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/screens/screens.dart';
import 'package:flutter_netflix_responsive_ui/widgets/responsive.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List<Widget> _screens = [
    HomeScreen(key: PageStorageKey('homeScreen')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.save,
    'More': Icons.menu
  };
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: _icons
                  .map((title, icon) => MapEntry(
                      title,
                      BottomNavigationBarItem(
                          icon: Icon(icon, size: 30), title: Text(title))))
                  .values
                  .toList(),
              currentIndex: currentIndex,
              selectedFontSize: 11.0,
              unselectedFontSize: 11.0,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.black,
              onTap: (index) => setState(() => currentIndex = index),
            )
          : null,
    );
  }
}
