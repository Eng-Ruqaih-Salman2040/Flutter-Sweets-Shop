import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweets_shop_roq_2025/Sweets_Files_roq/homepageRoq.dart';
import 'package:sweets_shop_roq_2025/Sweets_Files_roq/profilePage_roq.dart';
import '../sweets_page.dart';
import 'product_list_page.dart';
import 'cart_provider_roq.dart';
import 'product_list_page.dart';
import 'cart_page_roq.dart';

void main() {
  runApp(
    CartSample_MyApp(),
  );
}
class SweetsShopAppRoq extends StatefulWidget {
  @override
  _SweetsShopAppRoqState createState() => _SweetsShopAppRoqState();
}

class _SweetsShopAppRoqState extends State<SweetsShopAppRoq> {
  ThemeMode _themeMode = ThemeMode.light; // الوضع الافتراضي: النهاري

  void toggleTheme(bool isDarkMode) {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
     child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'متجر الحلويات',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: Directionality( // Forces Right-to-Left (RTL) layout
    textDirection: TextDirection.rtl,
    child:
      MainScreenRoq(
          onThemeToggle: toggleTheme), // تغيير الصفحة الرئيسية إلى MainScreen
    )));
  }
}

class MainScreenRoq extends StatefulWidget {
  final Function(bool) onThemeToggle;

  MainScreenRoq({required this.onThemeToggle});

  @override
  _MainScreenRoqState createState() => _MainScreenRoqState();
}

class _MainScreenRoqState extends State<MainScreenRoq> {
  int _currentIndex = 0; // الصفحة النشطة حاليًا
  bool isDarkMode = false; // الوضع الليلي الافتراضي
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.add(HomePage_roq(
        onThemeToggle: widget.onThemeToggle,
        isDarkMode: isDarkMode)); // الصفحة الرئيسية
    _pages.add(ProductListPage()); // صفحة عرض المنتجات وسلة المشتريات
    //_pages.add(SweetsPage());
    // صفحة السلة
    _pages.add(CartPage());
    _pages.add(ProfilePage_Roq());
    //_pages.add(ProfilePageRoq());
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
}
//--------------------------------------------------------

class CartSample_MyApp extends StatefulWidget {
  @override
  State<CartSample_MyApp> createState() => _CartSample_MyAppState();
}

class _CartSample_MyAppState extends State<CartSample_MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: MaterialApp(
          title: 'Shopping Cart',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: '/',
          routes: {
    '/': (context) => ProductListPage(),
    '/cart': (context) => CartPage(),
    }) );

}}
