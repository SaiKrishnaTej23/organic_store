import 'package:Store/models/cartItem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Store/models/product.dart';

class Root with ChangeNotifier {
  User _user;
  List<CartItem> _cart;
  List<Product> _products = [];

  User getUser() {
    return _user;
  }

  void updateUser(User value) {
    _user = value;
    notifyListeners();
  }

  List<CartItem> getCart() => _cart;

  void addToCart(CartItem value) {
    if(_cart.any((element) => element.product.id == value.product.id))
      {
        CartItem item = _cart.firstWhere((element) => element.product.id == value.product.id);
        item.quantity = item.quantity + 1;
      }
    else {
      _cart.add(value);
    }
    notifyListeners();
  }

  List<Product> getProducts() => _products;

  void products(List<Product> value) {
    _products = value;
    notifyListeners();
  }
}