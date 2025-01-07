import 'package:flutter/material.dart';
import 'package:hf_ai_app/screens/image_generation/image_generation_screen.dart';
import 'package:hf_ai_app/core/utils/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: _getBottomNavBar(),
          appBar: AppBar(centerTitle: true,
            elevation: 20,
            title: Text(
              'DynamAI',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            backgroundColor: primary,
          ),
          body: getViews(selectedIndex)),
    );
  }

  Widget _getBottomNavBar() {
    return BottomNavigationBar(
      selectedIconTheme: const IconThemeData(size: 35),
      items: _getItems(),
      currentIndex: selectedIndex,
      onTap: (value) {
        setState(() {
          selectedIndex = value;
        });
      },
    );
  }
}

List<BottomNavigationBarItem> _getItems() {
  List<BottomNavigationBarItem> itemsList = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.storage_rounded), label: ''),
    const BottomNavigationBarItem(
        icon: Icon(Icons.photo_outlined), label: 'Images'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person), label: 'Account'),
  ];
  return itemsList;
}

getViews(int selectedIndex) {
  switch (selectedIndex) {
    case 0:
      return const Center(
        child: Text('Coming Soon'),
      );
    case 1:
      return const ImageGeneration();
    case 2:
      return const Center(
        child: Text('Coming Soon'),
      );
    default:
      return;
  }
}
