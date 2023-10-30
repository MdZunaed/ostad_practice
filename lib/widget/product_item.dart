import 'package:flutter/material.dart';
import 'package:ostad_practice/screen/add_product_page.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
          'https://miro.medium.com/v2/resize:fit:1400/1*YMJDp-kqus7i-ktWtksNjg.jpeg'),
      trailing: const Text("\$123"),
      title: const Text("Product Name"),
      subtitle:
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Text("product code"),
          SizedBox(width: 20),
          Text("price")
        ]),
        Text("description")
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
                      builder: (context) => const AddNewProduct()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text("Delete"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
