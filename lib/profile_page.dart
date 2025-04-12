import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الملف الشخصي"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Text(
          'هذه صفحة الملف الشخصي.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
