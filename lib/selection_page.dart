import 'package:flutter/material.dart';

class Item {
  String name;
  bool isSelected;

  Item({required this.name, required this.isSelected});
}

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

List<Item> items = List.generate(
    8, (index) => Item(name: "Item ${index + 1}", isSelected: false));

int getSelectedItemCount() {
  return items.where((item) => item.isSelected).length;
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Selection Screen",
        style: TextStyle(color: Colors.white),
      )),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: items[index].isSelected ? Colors.lightBlue : null,
              title: Text(items[index].name),
              onTap: () {
                items[index].isSelected = !items[index].isSelected;
                setState(() {});
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            int selectedCount = getSelectedItemCount();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    title: const Text('Selected Items'),
                    content: Text('Number of selected items: $selectedCount'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'))
                    ]);
              },
            );
          },
          child: const Icon(Icons.check, color: Colors.white)),
    );
  }
}
