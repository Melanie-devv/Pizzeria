import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/models/pizza.dart';
import 'package:provider/provider.dart';

class BuyButtonWidget extends StatelessWidget {
  final Pizza _pizza;
  const BuyButtonWidget(this._pizza, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtention de l'objet cart depuis le panier
    // nous n'écoutons pas les notifications émises
    var cart = Provider.of<Cart>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.red.shade800)
          ),
          child: Row(
            children: [
              Icon(Icons.shopping_cart),
              SizedBox(width: 5),
              Text("Commander"),
            ],
          ),
          onPressed: (){
            print('Commander une pizza');
            cart.addProduct(_pizza);
          },
        ),
      ],
    );
  }
}
