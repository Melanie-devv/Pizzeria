import 'pizza.dart';

class PizzaData {
  static List<Pizza> buildList() {
    List<Pizza> list = [];
      list.add(Pizza(1, 'Barbecue', 'Sauce bbq, oignons, fromage, jambon', 'pizza-bbq.jpg', 8));
      list.add(Pizza(2, 'Hawai', 'Sauce crème, ananas, champignon, lardon', 'pizza-hawai.jpg', 9));
      list.add(Pizza(3, 'Epinards', 'Epinard, feta, tomate, pomme de terre', 'pizza-spinach.jpg', 7));
      list.add(Pizza(4, 'Végétarienne', 'Poivron, champignon, mais, tomate, olive', 'pizza-vegetable.jpg', 10));
      return list;
  }
}