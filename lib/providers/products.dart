import 'package:flutter/material.dart';
import 'package:Store/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => [..._products];

  set products(List<Product> value) {
    _products = value;
    notifyListeners();
  }
}