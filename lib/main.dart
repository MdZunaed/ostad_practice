import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List name = ["Apples","Bananas", "Bread", "Milk", "Eggs"];
    return  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions:const [Icon(Icons.shopping_cart)],
          title:const Text("My Shopping List")),

        body: Column(
          children: [
            Expanded(child:
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index){
              return ListTile(
                title: Text(name[index],style:const TextStyle(fontWeight: FontWeight.w500)),
                leading:const Icon(Icons.shopping_basket, color: Colors.blue),
              );
            })),
          ],
        ),
    );
  }
}
