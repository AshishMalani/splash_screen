import 'package:get/get.dart';

import '../model/productModel.dart';

class productController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));

    var productResult = [
      Product(
        1,
        'Mobile',
        'Mobile description',
        40,
      ),
      Product(
        2,
        'Tv',
        'Tv description',
        55,
      ),
      Product(
        3,
        'Laptop',
        'Laptop description',
        35,
      ),
    ];
    products.value = productResult;
  }
}
