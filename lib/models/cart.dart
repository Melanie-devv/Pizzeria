import 'package:flutter/material.dart';
import 'package:pizzeria/models/pizza.dart';

class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem(this.pizza, [this.quantity = 1]);
}

class Cart extends ChangeNotifier {
  List<CartItem> _items = [];

  int totalItems() { return _items.length; }
  CartItem getCartItem(int index) {
    return _items[index];
  }

  double totalPrice() {
    double total = 0;
    for (var cartItem in _items) {
      total +=  cartItem.pizza.total * cartItem.quantity;
    }
    return total;
  }

  int pizzaQuantity(Pizza pizza) {
    int total = 0;
    for (var cartItem in _items) {
      if(cartItem.pizza.title == pizza.title){
        total = cartItem.quantity;
      }
    }
    return total;
  }

  void addProduct(Pizza pizza) {
    // Recherche du produit
    int index = findCartItemIndex(pizza.id);
    if (index == -1) {
      // Ajout
      _items.add(CartItem(pizza));
    } else {
      // Incrémente la quantité
      CartItem item = _items[index];
      item.quantity++;
    }
    notifyListeners();
  }

  void removeProduct(Pizza pizza) {
    // Recherche du produit
    int index = findCartItemIndex(pizza.id);
    if (index != -1) {
      if (_items[index].quantity == 1) {
        // Supression
        _items.removeAt(index);
      } else {
        // Décrémente la quantité
        CartItem item = _items[index];
        item.quantity--;
      }
    }
    notifyListeners();
  }

  int findCartItemIndex(int id) {
    return _items.indexWhere((element) => element.pizza.id == id);
  }
}