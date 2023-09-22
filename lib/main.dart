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
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<int> count = List.filled(15, 0);
   int totalCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Product List")),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Product ${index + 1}"),
              subtitle: const Text("\$10.50"),
              trailing: FittedBox(
                child: Column(
                  children: [
                    Text("Counts: ${count[index]}"),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            count[index]++;
                            totalCount++;
                            if (count[index] == 5) {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text('Congratulations!'),
                                  content: Text(
                                      'You\'ve bought 5 Product ${index + 1}!'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child:const Text("Ok"))
                                  ],
                                ),
                              );
                            }
                          });
                        },
                        child: const Text("Buy Now"))
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(total: totalCount)));
          }, child: const Icon(Icons.shopping_cart)),
    );
  }
}

class CartPage extends StatelessWidget {
final int total;
  const CartPage({Key? key,required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text("Cart")),
      body: Center(child:
        Text("Total Product: $total")),
    );
  }
}

