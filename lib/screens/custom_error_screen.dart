import 'package:app_tienda_comida/screens/home_screen.dart';
import 'package:flutter/material.dart';

class CustomErrorScreen extends StatelessWidget {
  final String errorMsg;
  CustomErrorScreen({required this.errorMsg});

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
      decoration: BoxDecoration(
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
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_rounded,
            size: 200,
            color: Color(0xFFEDBEAF),
          ),
          Text(
            'ERROR',
            style: TextStyle(fontSize: 30, color: Color(0xFFF9C5B7)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.4,
              width: MediaQuery.sizeOf(context).width,
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Text(errorMsg,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFFCE3D5),
                      )),
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          ElevatedButton(
              style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(10),
                  padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 50)),
                  backgroundColor: WidgetStatePropertyAll(Color(0xFFFC8D82))),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeSrceen(),
                  ),
                  (route) => false,
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text('Menù Principal',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFCE3D5))),
              )),
              Spacer()
        ],
      ),
    );
  }
}
