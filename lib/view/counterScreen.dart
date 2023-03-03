import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/counterController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.4,
          ),
          Center(
              child: Obx(
            () => Text(
              '${controller.counter}',
              style: TextStyle(fontSize: 25),
            ),
          )),
          SizedBox(
            height: height * 0.27,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 27,
                child: IconButton(
                  onPressed: () {
                    controller.increment();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              CircleAvatar(
                radius: 27,
                child: IconButton(
                  onPressed: () {
                    controller.decrement();
                  },
                  icon: Icon(Icons.remove),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
