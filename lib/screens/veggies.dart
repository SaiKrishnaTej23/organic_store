import 'package:Store/sharedWidgets/product-card.dart';
import 'package:flutter/cupertino.dart';

class Veggies extends StatefulWidget {
  @override
  _VeggiesState createState() => _VeggiesState();
}

class _VeggiesState extends State<Veggies> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: (Container(
            child: (ProductCardWidget(
      name: "Carrot",
      currentPrice: 524,
      originalPrice: 699,
      discount: 25,
      imageUrl: "http://clipart-library.com/img1/994663.png",
    )))));
  }
}
