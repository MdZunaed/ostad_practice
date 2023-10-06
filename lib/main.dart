import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue)),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List sizes = ["S", "M", "L", "XL", "XXL", "XXXL"];
String selectedSize = '';

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Size Selector"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
                spacing: 10,
                runSpacing: 10,
                children: sizes.map((size) {
                  return InkWell(
                    onTap: () {
                      selectedSize = size;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(milliseconds: 800),
                          backgroundColor: Theme.of(context).primaryColor,
                          content: Text('Selected Size: $selectedSize')));
                      setState(() {});
                    },
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: size == selectedSize
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text(
                        size,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                  );
                }).toList())
          ],
        ),
      ),
    );
  }
}
