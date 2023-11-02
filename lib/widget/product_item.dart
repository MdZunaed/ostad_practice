import 'package:flutter/material.dart';
import 'package:ostad_practice/screen/add_product_page.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Function(String) onDelete;

  const ProductItem({super.key, required this.product, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: product.image.isEmpty
          ? const Icon(Icons.error)
          : Image.network(product.image, width: 70),
      trailing: Text("\$${product.totalPrice}"),
      title: Text(product.productName),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(product.productCode),
        Text("price: ${product.unitPrice}"),
        Text("Qty: ${product.quantity}")
      ]),
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return productActionDialog(context);
            });
      },
    );
  }

  AlertDialog productActionDialog(BuildContext context) {
    return AlertDialog(
      title: const Text("Select action"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Edit"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddNewProduct(product: product)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text("Delete"),
            onTap: () {
              Navigator.pop(context);
              onDelete(product.id);
            },
          ),
        ],
      ),
    );
  }
}
