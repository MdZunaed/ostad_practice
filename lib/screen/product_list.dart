import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ostad_practice/screen/add_product_page.dart';

import '../widget/product_item.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> productList = [];
  bool inProgress = false;

  void getProductList() async {
    inProgress = true;
    setState(() {});
    Response response =
        await get(Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['status'] == 'success') {
        for (Map<String, dynamic> productJson in responseData['data']) {
          productList.add(Product(
            productJson['_id'],
            productJson['ProductName'],
            productJson['ProductCode'],
            productJson['Img'],
            productJson['UnitPrice'],
            productJson['Qty'],
            productJson['TotalPrice'],
          ));
        }
      }
    }
    inProgress = false;
    setState(() {});
  }

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        actions: [
          IconButton(
              onPressed: () {
                productList.clear();
                getProductList();
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: inProgress
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              shrinkWrap: true,
              itemCount: productList.length,
              separatorBuilder: (c, i) => const Divider(),
              itemBuilder: (context, index) {
                return ProductItem(product: productList[index]);
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

class Product {
  final String id;
  final String productName;
  final String productCode;
  final String image;
  final String unitPrice;
  final String quantity;
  final String totalPrice;

  Product(this.id, this.productName, this.productCode, this.image,
      this.unitPrice, this.quantity, this.totalPrice);
}
