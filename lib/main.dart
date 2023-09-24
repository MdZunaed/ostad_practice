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
  Map<int,int> selectedProducts = {};
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
                    Text("Counts: ${selectedProducts[index]??0}"),
                    ElevatedButton(
                        onPressed: () {
                          if(selectedProducts.containsKey(index)){
                            selectedProducts[index] = selectedProducts[index]! + 1;
                          } else{
                            selectedProducts[index] = 1;
                          }
                          if (selectedProducts[index] == 5) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title:const Text('Congratulations!'),
                                  content: Text('You\'ve bought 5 Product $index!'),
                                  actions: <Widget>[
                                    TextButton(
                                      child:const Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          setState(() {});
                        },
                        child: const Text("Buy Now"))
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            int totalProduct = selectedProducts.length;
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(totalProductCount: totalProduct)));
          }, child: const Icon(Icons.shopping_cart)),
    );
  }
}

class CartPage extends StatelessWidget {
  final int totalProductCount;
  const CartPage({Key? key,required this.totalProductCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text("Cart")),
      body: Center(child:
        Text("Total Product: $totalProductCount")),
    );
  }
}

