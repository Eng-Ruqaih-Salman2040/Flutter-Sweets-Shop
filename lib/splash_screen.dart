import 'package:flutter/material.dart';
import 'Sweets_Files_roq/main_cartSample_roq.dart';
import 'main.dart';

class SplashScreen extends StatelessWidget {
  final Function(bool) onThemeToggle;

  SplashScreen({required this.onThemeToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // الانتقال إلى الشاشة الرئيسية (مع الأيقونات)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreenRoq(onThemeToggle: onThemeToggle),
            ),
          );
        },
        child: Container(
          color: Colors.black,
          child: Center(
            child: Text(
              'Taj Tab Sweets\n\nاضغط للمتابعة',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
