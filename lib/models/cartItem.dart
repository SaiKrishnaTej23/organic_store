import 'package:Store/models/product.dart';

class CartItem {
  Product _product;
  int _quantity = 0;

  Product get product => _product;

  set product(Product value) {
    _product = value;
  }

  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
  }
}