import 'package:flutter/material.dart';
import 'package:ostad_practice/screen/add_product_page.dart';

import '../widget/product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product List")),
      body: ListView.separated(
          shrinkWrap: true,
          itemCount: 10,
          separatorBuilder: (c, i) => const Divider(),
          itemBuilder: (context, index) {
            return const ProductItem();
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddNewProduct()));
          },
          child: const Icon(Icons.add)),
    );
  }
}
