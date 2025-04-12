
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider_roq.dart';
import 'product_roq.dart';

class ProductDetailsPage_Roq extends StatefulWidget {
  //final String imageUrl;
  final Product product;
  //const ProductDetailsPage_Roq({super.key, required this.imageUrl});
  ProductDetailsPage_Roq({super.key, required this.product} );

  @override
  State<ProductDetailsPage_Roq> createState() => _ProductDetailsPage_RoqState();
}

class _ProductDetailsPage_RoqState extends State<ProductDetailsPage_Roq> {
  @override
  Widget build(BuildContext context) {
    return   Directionality( // Forces Right-to-Left (RTL) layout
      textDirection: TextDirection.rtl,
      child:
      Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الحلى'),
        backgroundColor: Colors.orangeAccent,
        actions: const [
          //------------------------------------ProfileBtn(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

            Provider.of<CartProvider>(context, listen: false).addProduct(widget.product);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${widget.product.name} تمت الإضافة إلى السلة')),
            );

          // Add your onPressed code here!
        },
        label: const Text('اضافة الى السلة'),
        icon: const Icon(Icons.shopping_cart),
      ),
      body: ListView(
        children: [
          // Product image
          Image.asset(
            widget.product.image,
            height: MediaQuery.of(context).size.height / 1.8,
            fit: BoxFit.fill,
          ),

          // Product title
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Text('${widget.product.name} حلى :  ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),

          // Product description
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
                'البقلاوة من أشهر الحلويات الشرقية اللي اشتهرت في دول كثيرة زي تركيا، الشام، والبلدان العربية. تتكون بشكل أساسي من طبقات رقيقة من عجينة الفيلو أو الكلاج، وبينها حشوة مكسرات (زي الفستق، الجوز أو اللوز)، وبعد الخبز تُسقى بشراب السكر (الشيرة) المعطر بماء الزهر أو ماء الورد.'),
          ),

          // Product price
           Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '${widget.product.price} RY',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ), ),
    );
  }
}