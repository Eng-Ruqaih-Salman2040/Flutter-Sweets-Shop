import 'package:flutter/material.dart';
//import 'package:p2/sweets_page.dart';
//import 'cart_items_provider.dart'; // استيراد مزود العناصر المختارة
import 'package:provider/provider.dart'; // استيراد مكتبة Provider

class CartItemsProvider extends ChangeNotifier {
  List<Map<String, dynamic>> sweets =
      []; // تعريف القائمة الخاصة بالعناصر في السلة

  List<Map<String, dynamic>> get cartItems =>
      sweets; // تعريف الـ getter لقائمة العناصر في السلة

// يمكنك إضافة المزيد من الدوال هنا لإضافة وحذف العناصر في السلة

// باقي الكود لصفحة سلة المشتريات
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سلة المشتريات'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Consumer<CartItemsProvider>(
        builder: (context, cartItemsProvider, child) {
          return cartItemsProvider.cartItems.isEmpty
              ? Center(
                  child: Text(
                    'سلتك فارغة حالياً!',
                    style: TextStyle(fontSize: 10),
                  ),
                )
              : ListView.builder(
                  itemCount: cartItemsProvider.cartItems.length,
                  itemBuilder: (context, index) {
                    if (index < cartItemsProvider.cartItems.length) {
                      final item = cartItemsProvider.cartItems[index];
                      return ListTile(
                        leading: Image.asset(
                          item['image'],
                          width: 50,
                          height: 50,
                        ),
                        title: Text(item['name']),
                        subtitle: Text('السعر: ${item['price']}'),
                      );
                    } else {
                      return SizedBox(); // تجنب الوصول إلى فهرس خارج نطاق القائمة
                    }
                  },
                );
        },
      ),
    );
  }
}
