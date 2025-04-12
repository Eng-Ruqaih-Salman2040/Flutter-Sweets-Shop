import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class SweetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartItemsProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('قائمة الحلويات'),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Consumer<CartItemsProvider>(
          builder: (context, cartItemsProvider, child) {
            return ListView.builder(
              itemCount: cartItemsProvider.sweets.length,
              itemBuilder: (context, index) {
                final sweet = cartItemsProvider.sweets[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  elevation: 5,
                  child: ListTile(
                    leading: Image.asset(
                      sweet['image'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(sweet['name']),
                    subtitle: Text('السعر: ${sweet['price']}'),
                    trailing: Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            cartItemsProvider.addToCart(sweet);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        //  floatingActionButton: FloatingActionButton(
        //    child: Icon(Icons.shopping_cart),
        //    onPressed: () {
        //      Navigator.push(
        //        context,
        //        MaterialPageRoute(
        //          builder: (context) => CartPage(),
        //        ),
        //      );
        //    },
        //  ),
      ),
    );
  }
}

List<Map<String, dynamic>> cartItems = []; // العناصر المختارة

class CartItemsProvider with ChangeNotifier {
  List<Map<String, dynamic>> sweets = [
    //تعريف قائمة المشتريات
    {
      'name': 'بقلاوه',
      'image': 'images/krimh.png',
      'price': '15.00 ريال',
    },
    // العناصر الأخرى هنا
  ];

  void addToCart(Map<String, dynamic> sweet) {
    cartItems.add(sweet);
    print(cartItems);
    notifyListeners();
  }
}
