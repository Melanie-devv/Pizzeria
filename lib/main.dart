import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/panier.dart';
import 'package:pizzeria/ui/profil.dart';
import 'package:pizzeria/ui/share/appbar_widget.dart';
import 'package:pizzeria/ui/share/bottom_navigation_bar_widget.dart';
import 'package:provider/provider.dart';
import 'models/menu.dart';
import 'ui/pizza_list.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => ProfilModel()), // Ajoutez ProfilModel ici
      ],
        child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzéria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Notre pizzéria'),
      // start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen Widget
      /*initialRoute: '/',*/
      routes: {
        '/main': (context) => MyHomePage(title: 'Pizzeria'),
        '/panier': (context) => Panier(),
        '/commande': (context) =>  PizzaList(),
        '/profil': (context) => Profil()}
    );
  }
}

class MyHomePage extends StatelessWidget {
  String title;
  Cart _cart;

  MyHomePage({required this.title, Key? key}) :
    _cart = Cart(),
    super(key: key);

  var _menus = [
    Menu(1, 'Entrées', 'entree.png', Colors.lightGreen),
    Menu(2, 'Pizzas', 'pizza.png', Colors.redAccent),
    Menu(3, 'Desserts', 'dessert.png', Colors.brown),
    Menu(4, 'Boissons', 'boisson.png', Colors.lightBlue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title, _cart),
      body: Center(
        child: ListView.builder(
          itemCount: _menus.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                switch (_menus[index].type) {
                  case 2:
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PizzaList()),
                    );
                    break;
                }
              },
              child: _buildRow(_menus[index]),
            ),
        itemExtent: 180,
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(0),
    );
  }
  _buildRow(Menu menu){
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: menu.color,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      margin: EdgeInsets.all(4.0),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Image.asset(
                'assets/images/menus/${menu.image}',
                fit: BoxFit.fitWidth,
              ),
          ),
          Container(
            height: 50,
            child: Center(
              child: Text(
                menu.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}

