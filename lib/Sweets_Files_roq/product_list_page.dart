import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweets_shop_roq_2025/Sweets_Files_roq/productDetailes_roq.dart';
import 'cart_provider_roq.dart';
import 'product_roq.dart';
import 'product_details_page.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(id: '1', name: 'بقلاوه', price: 2.0,image:'images/krimh.png'),
    Product(id: '2', name: 'البسبوسة', price: 1.5,image:'images/krimh.png'),
    Product(id: '3', name: 'زنود الست', price: 20.8,image:'images/krimh.png'),
    Product(id: '4', name: 'اللقيمات (العوامة)', price: 66.8,image:'images/krimh.png'),
    Product(id: '5', name: 'الهريسة', price: 10.50,image:'images/krimh.png'),
    Product(id: '6', name: 'التيراميسو', price: 11.28,image:'images/krimh.png'),
    Product(id: '7', name: 'تشيز كيك', price: 10.8,image:'images/krimh.png'),
    Product(id: '8', name: 'الوافل', price: 110.8,image:'images/krimh.png'),
    Product(id: '9', name: 'الكوكيز', price: 120.8,image:'images/krimh.png'),
    Product(id: '10', name: 'الكب كيك', price: 176.8,image:'images/krimh.png'),
    Product(id: '3', name: 'الأكلير', price: 143.8,image:'images/krimh.png'),
  ];
  List<Map<String, dynamic>> sweets = [
    //تعريف قائمة المشتريات
    {
      'name': 'بقلاوه',
      'image': 'images/krimh.png',
      'price': '15.00 ريال',
    },
    // العناصر الأخرى هنا
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(
    title: Text('قائمة الحلويات'),
    backgroundColor: Colors.orangeAccent,

       /* actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],*/
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              elevation: 5,
              child: ListTile(
              leading: Image.asset(
          product.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          //---------------------------

            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailsPage_Roq(product: product),

                  //builder: (context) => ProductDetailsPage(product: product),
                ),
              );
            },
            trailing: ElevatedButton(
              child: Text('أضف الى السلة'),
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addProduct(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} تمت الاضافة الى السلة : ')),
                );
              },
            ),
          ));
        },
      ),
    );
  }
}
