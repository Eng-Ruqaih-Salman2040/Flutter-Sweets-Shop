import 'package:flutter/material.dart';
import 'product_roq.dart';

class CartProvider with ChangeNotifier {
  final Map<String, int> _cartItems = {}; // {productId: quantity}
  final Map<String, Product> _productDetails = {}; // {productId: Product}

  Map<String, int> get cartItems => _cartItems;

  Map<String, Product> get productDetails => _productDetails;

  double get totalPrice => _cartItems.entries
      .map((entry) => _productDetails[entry.key]!.price * entry.value)
      .fold(0.0, (sum, price) => sum + price);

  int get totalQuantity => _cartItems.values.fold(0, (sum, quantity) => sum + quantity);

  void addProduct(Product product) {
    if (_cartItems.containsKey(product.id)) {
      _cartItems[product.id] = _cartItems[product.id]! + 1;
    } else {
      _cartItems[product.id] = 1;
      _productDetails[product.id] = product;
    }
    notifyListeners();
  }

  void incrementQuantity(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems[productId] = _cartItems[productId]! + 1;
      notifyListeners();
    }
  }

  void decrementQuantity(String productId) {
    if (_cartItems.containsKey(productId) && _cartItems[productId]! > 1) {
      _cartItems[productId] = _cartItems[productId]! - 1;
      notifyListeners();
    } else {
      removeProduct(productId);
    }
  }

  void removeProduct(String productId) {
    _cartItems.remove(productId);
    _productDetails.remove(productId);
    notifyListeners();
  }
}
