import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ostad_practice/models/product.dart';

class AddNewProduct extends StatefulWidget {
  final Product? product;

  const AddNewProduct({super.key, this.product});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productCodeController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController unitPriceController = TextEditingController();
  final TextEditingController totalPriceController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool addInProgress = false;

  Future<void> addNewProduct() async {
    addInProgress = true;
    setState(() {});
    // final Product product = Product(
    //     '',
    //     productNameController.text.trim(),
    //     productCodeController.text.trim(),
    //     imageUrlController.text.trim(),
    //     unitPriceController.text.trim(),
    //     quantityController.text.trim(),
    //     totalPriceController.text.trim());
    final Map<String, String> product = {
      'ProductName': productNameController.text.trim(),
      'ProductCode': productCodeController.text.trim(),
      'Img': imageUrlController.text.trim(),
      'UnitPrice': unitPriceController.text.trim(),
      'Qty': quantityController.text.trim(),
      'TotalPrice': totalPriceController.text.trim(),
    };
    final Response response = await post(
        Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(product));
    if (response.statusCode == 200) {
      productNameController.clear();
      productCodeController.clear();
      imageUrlController.clear();
      quantityController.clear();
      unitPriceController.clear();
      totalPriceController.clear();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("product added")));
    } else if (response.statusCode == 400) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("error")));
    }
    addInProgress = false;
    setState(() {});
  }

  Future<void> updateProduct() async {
    addInProgress = true;
    setState(() {});
    // final Product product = Product(
    //     '',
    //     productNameController.text.trim(),
    //     productCodeController.text.trim(),
    //     imageUrlController.text.trim(),
    //     unitPriceController.text.trim(),
    //     quantityController.text.trim(),
    //     totalPriceController.text.trim());
    final Map<String, String> inputMap = {
      'ProductName': productNameController.text.trim(),
      'ProductCode': productCodeController.text.trim(),
      'Img': imageUrlController.text.trim(),
      'UnitPrice': unitPriceController.text.trim(),
      'Qty': quantityController.text.trim(),
      'TotalPrice': totalPriceController.text.trim(),
    };
    final Response response = await post(
        Uri.parse(
            'https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product!.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(inputMap));
    print(response.statusCode);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("product updated")));
    } else if (response.statusCode == 400) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("error")));
    }
    addInProgress = false;
    setState(() {});
  }

  @override
  void initState() {
    if (widget.product != null) {
      productNameController.text = widget.product!.productName;
      productCodeController.text = widget.product!.productCode;
      imageUrlController.text = widget.product!.image;
      quantityController.text = widget.product!.quantity;
      unitPriceController.text = widget.product!.unitPrice;
      totalPriceController.text = widget.product!.totalPrice;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add new product")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                  controller: productNameController,
                  validator: isValidate,
                  decoration: const InputDecoration(
                      label: Text("Product Name"),
                      hintText: "Enter product Name")),
              TextFormField(
                  controller: productCodeController,
                  validator: isValidate,
                  decoration: const InputDecoration(
                      label: Text("Product Code"),
                      hintText: "Enter product Code")),
              TextFormField(
                  controller: imageUrlController,
                  validator: isValidate,
                  decoration: const InputDecoration(
                      label: Text("Image Url"),
                      hintText: "Enter product image url")),
              TextFormField(
                  controller: quantityController,
                  validator: isValidate,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Quantity"),
                      hintText: "Enter product quantity")),
              TextFormField(
                  controller: unitPriceController,
                  validator: isValidate,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Price"), hintText: "Enter product price")),
              TextFormField(
                  controller: totalPriceController,
                  validator: isValidate,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Total price"),
                      hintText: "Product total price")),
              const SizedBox(height: 20),
              addInProgress
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              widget.product == null
                                  ? addNewProduct()
                                  : updateProduct();
                            }
                          },
                          child: Text(widget.product != null
                              ? "Update"
                              : "Add Product")),
                    )
            ],
          ),
        ),
      ),
    );
  }

  String? isValidate(String? value) {
    if (value?.trim().isNotEmpty ?? false) {
      return null;
    }
    return "Enter valid value";
  }

  @override
  void dispose() {
    productNameController.dispose();
    productCodeController.dispose();
    imageUrlController.dispose();
    quantityController.dispose();
    unitPriceController.dispose();
    totalPriceController.dispose();
    super.dispose();
  }
}
