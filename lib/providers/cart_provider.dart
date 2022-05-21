import 'package:coffee/models/cart_model.dart';
import 'package:coffee/models/product_model.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  CartModel? _cart;

  CartModel? get cart => _cart;

  int quantity = 0;

  void addToCart(ProductModel product) {
    if (_cart == null) {
      _cart = CartModel(
        totalPrice: product.price,
        products: [product],
      );
      quantity = 1;
    } else {
      _cart!.products!.contains(product)
          ? _cart!.products!
              .firstWhere((element) => element == product)
              .quantity++
          : _cart!.products!.add(product);
      _cart!.totalPrice = _cart!.totalPrice! + product.price!;

      quantity++;
    }
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    if (_cart!.products!.contains(product)) {
      _cart!.products!.firstWhere((element) => element == product).quantity--;
      quantity--;

      _cart!.totalPrice = _cart!.totalPrice! - product.price!;

      if (_cart!.products!
              .firstWhere((element) => element == product)
              .quantity ==
          0) {
        _cart!.products!.remove(product);
      }
    }

    notifyListeners();
  }

  void clearCart() {
    _cart = CartModel(
      totalPrice: 0,
      products: [],
    );
    quantity = 0;
    notifyListeners();
  }
}
