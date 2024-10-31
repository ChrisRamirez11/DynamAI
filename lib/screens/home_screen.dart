import 'package:flutter/material.dart';
import 'package:hf_ai_app/screens/image_generation_screen.dart';
import 'package:hf_ai_app/utils/theme.dart';

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
          bottomNavigationBar: getBottomNavBar(),
          appBar: AppBar(elevation: 20,title: Center(child: Text('DynamAI', style: Theme.of(context).textTheme.bodyLarge,)),
            backgroundColor: primary,
          ),
          body: getViews(selectedIndex)),
    );
  }


  Widget getBottomNavBar() {
    return BottomNavigationBar(
      selectedIconTheme: const IconThemeData(size: 35),
      items: getItems(),
      currentIndex: selectedIndex,
      onTap: (value) {
        setState(() {
          selectedIndex = value;
        });
      },
    );
  }
}

List<BottomNavigationBarItem> getItems() {
  List<BottomNavigationBarItem> itemsList = [
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
    const BottomNavigationBarItem(
        icon: Icon(Icons.photo_outlined), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.supervisor_account_outlined), label: ''),
  ];
  return itemsList;
}

getViews(int selectedIndex) {
  switch (selectedIndex) {
    case 0:
      return const Center(child: Text('Proximamente'),);
    case 1:
      return const Textgeneration();
    case 2:
      return const Center(child: Text('Proximamente'),);
    default:
      return;
  }
}
