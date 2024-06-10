import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/share/bottom_navigation_bar_widget.dart';
import 'package:provider/provider.dart';

class Panier extends StatelessWidget {
  Panier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _CartList(),
            ),
          ),
          _CartTotal(),
        ],
      ),
        bottomNavigationBar: BottomNavigationBarWidget(2),
    );
  }
}

class _CartList extends StatelessWidget {
  var format = NumberFormat("###.00 €");

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();

    return ListView.builder(
      itemCount: cart.totalItems(), // Utiliser le nombre total d'articles dans le panier
      itemBuilder: (context, index) {
        var cartItem = cart.getCartItem(index);
        return _buildItem(cartItem, context);
      },
    );
  }

  Widget _buildItem(CartItem cartItem, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Text(
            cartItem.pizza.title,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${cartItem.pizza.garniture}',
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 2),
                        Text("+"),
                      ],
                    ),
                    onPressed: () {
                      context.read<Cart>().addProduct(cartItem.pizza);
                    },
                  ),
                  Text(
                    '${context.read<Cart>().pizzaQuantity(cartItem.pizza)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 2),
                        Text("-"),
                      ],
                    ),
                    onPressed: () {
                      context.read<Cart>().removeProduct(cartItem.pizza);
                    },
                  ),
                ],
              ),
              Image.network(
                cartItem.pizza.image,
                height: 160,
                width: MediaQuery.of(context).size.width / 2,
                fit: BoxFit.fitWidth,
              ),
              Text(
                '${format.format(cartItem.pizza.total * cartItem.quantity)}',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  var format = NumberFormat("###.00 €");

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      height: 140,
      child: Consumer<Cart>(
        builder: (context, cart, child) {
          final double _total = cart.totalPrice();

          if (_total == 0) {
            return Center(
              child: Text(
                'Aucun produit',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TOTAL',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            '${format.format(_total*0.8333)}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade200,
                            ),
                          ),
                          Text(
                            'HT',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade200,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${format.format(_total)}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            'TTC',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text('Valider'),
                      onPressed: () {
                        print('Valider');
                      },
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}