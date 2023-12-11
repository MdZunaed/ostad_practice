import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_practice/controller/count_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final countController = Get.find<CountController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GetX example")),
      body: Center(child: GetBuilder<CountController>(
        builder: (controller) {
          return Text(controller.count.toString(),
              style: const TextStyle(fontSize: 30));
        },
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            countController.increase();
          },
          child: const Icon(Icons.add)),
    );
  }
}
