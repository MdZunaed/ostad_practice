import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ostad_practice/screen/add_product_page.dart';
import '../models/product.dart';
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
    productList.clear();
    inProgress = true;
    setState(() {});
    Response response =
        await get(Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['status'] == 'success') {
        for (Map<String, dynamic> productJson in responseData['data']) {
          productList.add(Product.fromJson(productJson));
        }
      }
    }
    inProgress = false;
    setState(() {});
  }

  void deleteProduct(String productId) async {
    inProgress = true;
    setState(() {});
    Response response = await get(Uri.parse(
        'https://crud.teamrabbil.com/api/v1/DeleteProduct/$productId'));
    if (response.statusCode == 200) {
      getProductList();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("product deleted")));
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
                getProductList();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getProductList();
        },
        child: inProgress
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                shrinkWrap: true,
                itemCount: productList.length,
                separatorBuilder: (c, i) => const Divider(),
                itemBuilder: (context, index) {
                  return ProductItem(
                      product: productList[index],
                      onDelete: (String productId) {
                        deleteProduct(productId);
                      });
                }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddNewProduct()));
          },
          child: const Icon(Icons.add)),
    );
  }
}

// class Product {
//   final String id;
//   final String productName;
//   final String productCode;
//   final String image;
//   final String unitPrice;
//   final String quantity;
//   final String totalPrice;
//
//   Product(this.id, this.productName, this.productCode, this.image,
//       this.unitPrice, this.quantity, this.totalPrice);
// }
