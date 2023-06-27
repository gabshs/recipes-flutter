import 'package:flutter/material.dart';
import 'package:recipes/screens/categories_screen.dart';
import 'package:recipes/screens/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;

  static const List<Map<String, dynamic>> _screens = [
    {"title": "Cardápio", "screen": CategoriesScreen()},
    {"title": "Favoritos", "screen": FavoriteScreen()},
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(_screens[_selectedIndex]["title"]),
      ),
      body: _screens[_selectedIndex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        iconSize: 24,
        selectedItemColor: Colors.black,
        onTap: _selectScreen,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
