import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Ostad Live Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title:const Text("Profile",style: TextStyle(color: Colors.white)),
      ),
      body:const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle_rounded,color: Colors.green,size: 50),
            Text("Jhon Doe",style: TextStyle(color: Colors.green,fontSize: 25)),
            Text("Flutter Batch 4",style: TextStyle(color: Colors.blue,fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
