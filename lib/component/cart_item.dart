import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String name;
  final String color;
  final String size;
  final String image;
  final int count;
  final int price;
  final VoidCallback onRemove;
  final VoidCallback onAdd;

  const CartItem(
      {super.key,
      required this.name,
      required this.color,
      required this.size,
      required this.image,
      required this.count,
      required this.price,
      required this.onRemove,
      required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Expanded(flex: 1, child: Image.network(image, fit: BoxFit.cover)),
          Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(name,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const Icon(Icons.more_vert)
                          ]),
                      Row(children: [
                        const Text("Color: ",
                            style: TextStyle(color: Colors.grey)),
                        Text(color),
                        const SizedBox(width: 10),
                        const Text("Size: ",
                            style: TextStyle(color: Colors.grey)),
                        Text(size),
                      ]),
                      const SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              InkWell(
                                  onTap: onRemove,
                                  child: const Material(
                                      elevation: 4,
                                      shape: CircleBorder(),
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Icon(Icons.remove,
                                              color: Colors.black)))),
                              const SizedBox(width: 10),
                              Text(count.toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(width: 10),
                              InkWell(
                                  onTap: onAdd,
                                  child: const Material(
                                      elevation: 4,
                                      shape: CircleBorder(),
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Icon(Icons.add,
                                              color: Colors.black)))),
                            ]),
                            Text("$price\$",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold))
                          ]),
                    ]),
              )),
        ],
      ),
    );
  }
}
