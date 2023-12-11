import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_practice/controller/count_controller.dart';
import 'screen/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialBinding: GetXBindings(),
      home: const HomePage(),
    );
  }
}

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CountController());
  }
}
