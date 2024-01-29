import 'package:flutter/material.dart';

class cartModel extends ChangeNotifier {
  //list of items for sale
  final List _shopItems = [
    ['Avocado', 20, "lib/assets/avocado.png", Colors.green],
    ['banana', 10, "lib/assets/banana.png", Colors.yellow],
    ['Chicken', 200, "lib/assets/chicken.png", Colors.brown],
    ['water', 25, "lib/assets/water.png", Colors.blue]
  ];
  final List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  //add element tothe cart

  void addElement(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove element from the cart

  void removeElement(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //total price

  String totalPrice() {
    int price = 0;

    for (int i = 0; i < _cartItems.length; i++) {
      price += int.parse(_cartItems[i][1].toString());
    }
    return price.toString();
  }
}
