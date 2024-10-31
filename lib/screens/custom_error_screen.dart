
import 'package:flutter/material.dart';
import 'package:hf_ai_app/screens/home_screen.dart';

class CustomErrorScreen extends StatelessWidget {
  final String errorMsg;
  const CustomErrorScreen({super.key, required this.errorMsg});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          getBackground(),
          getColumn(context),
        ],
      ),
    ));
  }

  getBackground() {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0, 0),
              end: Alignment(0, 1.8),
              colors: [
            Color.fromRGBO(45, 50, 80, 1),
            Color.fromRGBO(89, 150, 194, 1),
          ])),
    );
  }

  getColumn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          const Icon(
            Icons.warning_rounded,
            size: 200,
            color: Color(0xFFEDBEAF),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'ERROR',
            style: TextStyle(fontSize: 30, color: Color(0xFFF9C5B7)),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(errorMsg,textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Color(0xFFFCE3D5),)),
          ),
          Expanded(child: Container()),
          ElevatedButton(
              style: const ButtonStyle(
                  elevation: WidgetStatePropertyAll(10),
                  padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 50)),
                  backgroundColor: WidgetStatePropertyAll(Color(0xFFFC8D82))),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (route) => false,
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text('Menù Principal',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFFCE3D5))),
              )),
          const SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}
