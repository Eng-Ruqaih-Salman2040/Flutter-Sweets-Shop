import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider_roq.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(

    appBar: AppBar(
    title: Text('سلة المشتريات'),
    backgroundColor: Colors.orangeAccent,
    ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final productId = cartProvider.cartItems.keys.toList()[index];
                final quantity = cartProvider.cartItems[productId]!;
                final product = cartProvider.productDetails[productId]!;

                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('Price: \$${product.price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => cartProvider.decrementQuantity(productId),
                      ),
                      Text('$quantity'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => cartProvider.incrementQuantity(productId),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Total Quantity: ${cartProvider.totalQuantity}'),
                Text('Total Price: \$${cartProvider.totalPrice.toStringAsFixed(2)}'),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text('Checkout'),
                  onPressed: () {
                    // Handle checkout logic
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
