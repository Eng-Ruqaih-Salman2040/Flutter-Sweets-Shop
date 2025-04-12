import 'package:flutter/material.dart';

class HomePage_roq extends StatelessWidget {
  final Function(bool) onThemeToggle;
  final bool isDarkMode;

  HomePage_roq({required this.onThemeToggle, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية: صورة تملأ الشاشة بالكامل
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/cokies.png'), // الصورة
                fit: BoxFit.cover, // لجعل الصورة تغطي الشاشة
              ),
            ),
          ),

          // محتوى النصوص والتبديل
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'مرحباً بك في متجر الحلويات!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                SwitchListTile(
                  value: isDarkMode,
                  onChanged: (value) {
                    onThemeToggle(value);
                  },
                  title: Text(
                    'الوضع الليلي',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
