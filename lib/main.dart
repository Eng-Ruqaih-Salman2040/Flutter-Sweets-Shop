import 'package:flutter/material.dart';

import 'Sweets_Files_roq/main_cartSample_roq.dart';

//import 'cart_items_provider.dart';

void main() {
  runApp(SweetsShopAppRoq());
}

/*class SweetsShopApp extends StatefulWidget {
  @override
  _SweetsShopAppState createState() => _SweetsShopAppState();
}

class _SweetsShopAppState extends State<SweetsShopApp> {
  ThemeMode _themeMode = ThemeMode.light; // الوضع الافتراضي: النهاري

  void toggleTheme(bool isDarkMode) {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'متجر الحلويات',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: MainScreen(
          onThemeToggle: toggleTheme), // تغيير الصفحة الرئيسية إلى MainScreen
    );
  }
}

class MainScreen extends StatefulWidget {
  final Function(bool) onThemeToggle;

  MainScreen({required this.onThemeToggle});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // الصفحة النشطة حاليًا
  bool isDarkMode = false; // الوضع الليلي الافتراضي
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.add(HomePage(
        onThemeToggle: widget.onThemeToggle,
        isDarkMode: isDarkMode)); // الصفحة الرئيسية
    _pages.add(SweetsPage()); // صفحة عرض المنتجات وسلة المشتريات
    //_pages.add(CartPage());
    // صفحة السلة
    _pages.add(ProfilePage());
   // _pages.add(CartPage());
    // صفحة الملف الشخصي
  }

  void _toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
      widget.onThemeToggle(isDarkMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // عرض الصفحة النشطة
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}*/
