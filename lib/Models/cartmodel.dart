// ignore_for_file: invalid_required_positional_param, unused_field, unnecessary_null_comparison

import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

//to display the item count
  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, itemInCart) {
      total += itemInCart.price * itemInCart.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    //check if item is present in cart
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (presentCartItem) => CartItem(
              id: presentCartItem.id,
              title: presentCartItem.title,
              quantity: presentCartItem.quantity,
              price: presentCartItem.price));
      //change quantity
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }


void deleteItem(String productId){
  _items.remove(productId);
  notifyListeners();
}
}