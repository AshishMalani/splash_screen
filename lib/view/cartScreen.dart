import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cartController.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController cController = Get.find<cartController>();

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text('Items'),
        actions: [
          Center(
            child: Obx(
              () => Text(
                cController.cartItems.length.toString(),
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
            child: GetBuilder<cartController>(
              builder: (cartController controller) {
                return Obx(() => ListView.builder(
                      itemCount: controller.cartItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading:
                              Text(controller.cartItems[index].productName),
                          title: Text(
                              controller.cartItems[index].price.toString()),
                          trailing: IconButton(
                            onPressed: () {
                              controller.removeFromCart(
                                  controller.cartItems[index].id);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        );
                      },
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
