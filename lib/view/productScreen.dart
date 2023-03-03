import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cartController.dart';
import '../controller/productController.dart';
import 'cartScreen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final productController pController = Get.put(productController());
    final cartController cController = Get.put(cartController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Products',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: GetX<productController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      var common = controller.products[index];
                      return Card(
                        color: Colors.grey.shade100,
                        margin: EdgeInsets.only(bottom: 20),
                        child: Container(
                          height: height * 0.15,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    common.id.toString(),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Text(common.productName),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(common.productDescription),
                                  Text(common.price.toString()),
                                  MaterialButton(
                                    onPressed: () {
                                      cController.addToCart(
                                          controller.products[index]);
                                    },
                                    textColor: Colors.white,
                                    height: height * 0.05,
                                    minWidth: width * 0.3,
                                    color: Colors.blue,
                                    child: Text(
                                      'Add to cart',
                                    ),
                                  )
                                ],
                              )
                            ]),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            MaterialButton(
              height: height * 0.055,
              minWidth: double.infinity,
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Get.to(() => CartScreen());
              },
              child: Text(
                'View cart',
                style: TextStyle(fontSize: 17),
              ),
            ),
            // GetX<cartController>(builder: (controller) {
            //   return Text(
            //     'Total amount: ${controller.totalPrice}',
            //     style: TextStyle(fontSize: 20),
            //   );
            // }),
            SizedBox(
              height: height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
