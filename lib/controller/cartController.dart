import 'package:get/get.dart';

import '../model/productModel.dart';

class cartController extends GetxController {
  var cartItems = <Product>[].obs;

  int get count => cartItems.length;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  void addToCart(Product product) {
    cartItems.add(product);
  }

  void removeFromCart(int id) {
    cartItems.removeWhere((item) => item.id == id);
  }
}
