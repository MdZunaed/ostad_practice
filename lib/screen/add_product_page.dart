import 'package:flutter/material.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController productCodeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController totalPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add new product")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                    label: Text("Title"), hintText: "Enter product title")),
            TextFormField(
                controller: productCodeController,
                decoration: const InputDecoration(
                    label: Text("Product Code"),
                    hintText: "Enter product Code")),
            TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    label: Text("Description"),
                    hintText: "Enter product description")),
            TextFormField(
                controller: quantityController,
                decoration: const InputDecoration(
                    label: Text("Quantity"),
                    hintText: "Enter product quantity")),
            TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text("Price"), hintText: "Enter product price")),
            TextFormField(
                controller: totalPriceController,
                decoration: const InputDecoration(
                    label: Text("Total price"),
                    hintText: "Product total price")),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: const Text("Add Product"))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    productCodeController.dispose();
    descriptionController.dispose();
    quantityController.dispose();
    priceController.dispose();
    totalPriceController.dispose();
    super.dispose();
  }
}
