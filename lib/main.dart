import 'package:flutter/material.dart';
import 'package:ostad_practice/bottom_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
          primaryColor: Colors.redAccent),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController addTitleController = TextEditingController();
TextEditingController addDetailsController = TextEditingController();
TextEditingController editTitleController = TextEditingController();
TextEditingController editDetailsController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey();
GlobalKey<FormState> editFormKey = GlobalKey();
List<Item> itemList = [];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.search, color: Colors.red))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              MyTextField(
                  hintText: "enter title", controller: addTitleController),
              const SizedBox(height: 10),
              MyTextField(
                  hintText: "enter description",
                  controller: addDetailsController),
              ElevatedButton(
                  onPressed: () {
                    addItem();
                  },
                  child: const Text("Add")),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: itemList.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemBuilder: (context, index) {
                      final Item item = itemList[index];
                      return Card(
                        color: Colors.grey.shade300,
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Text("${index + 1}")),
                          title: Text(item.title,
                              style: const TextStyle(fontSize: 17)),
                          subtitle: Text(item.details),
                          trailing: const Icon(Icons.arrow_forward),
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Alert"),
                                    content: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                editTitleController.text =
                                                    item.title;
                                                editDetailsController.text =
                                                    item.details;
                                                Navigator.pop(context);
                                                updateItem(context, index);
                                              },
                                              child: const Text("Edit")),
                                          TextButton(
                                              onPressed: () {
                                                itemList.removeAt(index);
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              child: const Text("Delete")),
                                        ]),
                                  );
                                });
                          },
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addItem() {
    if (formKey.currentState!.validate()) {
      Item item = Item(
          title: addTitleController.text.trim(),
          details: addDetailsController.text.trim());
      itemList.add(item);
      addTitleController.clear();
      addDetailsController.clear();
      setState(() {});
    }
  }

  updateItem(context, index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return MyBottomSheet(
              formKey: editFormKey,
              titleController: editTitleController,
              detailsController: editDetailsController,
              onButtonTap: () {
                if (editFormKey.currentState!.validate()) {
                  Item newItem = Item(
                      title: editTitleController.text.trim(),
                      details: editDetailsController.text.trim());
                  itemList[index] = newItem;
                  Navigator.pop(context);
                  setState(() {});
                }
              });
        });
  }
}

class Item {
  String title;
  String details;

  Item({required this.title, required this.details});
}

// floatingActionButton: FloatingActionButton(
//   onPressed: () {
//     addTodo();
//   },
//   child: const Icon(Icons.add),
// ),
