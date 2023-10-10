import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan),
          primaryColor: Colors.cyan),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController addController = TextEditingController();
TextEditingController updateController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey();
List<String> todos = [];
List<Todo> todoList = [];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Task"), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo();
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: todoList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final Todo todo = todoList[index];
              final date = DateFormat('hh:mm a dd-MM-yy').format(todo.dateTime);
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  tileColor: todo.status == "pending"
                      ? Colors.amberAccent
                      : Theme.of(context).primaryColor,
                  leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text("${index + 1}")),
                  title: Text(todo.todo),
                  subtitle: Text(date),
                  trailing: Text(todo.status.toUpperCase()),
                  onLongPress: () {
                    todo.status = todo.status == "pending" ? "done" : "pending";
                    setState(() {});
                  },
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                    leading: const Icon(Icons.restore,
                                        color: Colors.amberAccent),
                                    title: Text(todo.status == "pending"
                                        ? "mark as done"
                                        : "mark as pending"),
                                    onTap: () {
                                      todo.status = (todo.status == "pending")
                                          ? "done"
                                          : "pending";
                                      setState(() {});
                                      Navigator.pop(context);
                                    }),
                                ListTile(
                                    leading: const Icon(Icons.edit,
                                        color: Colors.cyan),
                                    title: const Text("Update"),
                                    onTap: () {
                                      updateController.text = todo.todo;
                                      Navigator.pop(context);
                                      updateTask(index);
                                    }),
                                ListTile(
                                    leading: const Icon(Icons.delete,
                                        color: Colors.red),
                                    title: const Text("Delete"),
                                    onTap: () {
                                      todoList.removeAt(index);
                                      Navigator.pop(context);
                                      setState(() {});
                                    }),
                              ],
                            ),
                          );
                        });
                  },
                ),
              );
            }),
      ),
    );
  }

  addTodo() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return MyBottomSheet(
              formKey: formKey,
              title: "Add new task",
              buttonName: "Add",
              teController: addController,
              onButtonTap: () {
                if (formKey.currentState!.validate()) {
                  Todo todo = Todo(
                      todo: addController.text.trim(),
                      dateTime: DateTime.now());
                  todoList.add(todo);
                  Navigator.pop(context);
                  addController.clear();
                  setState(() {});
                }
              });
        });
  }

  updateTask(index) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return MyBottomSheet(
              formKey: formKey,
              title: "Update your task",
              buttonName: "Update",
              teController: updateController,
              onButtonTap: () {
                if (formKey.currentState!.validate()) {
                  String newTodo = updateController.text.trim();
                  todoList[index].todo = newTodo;
                  setState(() {});
                  Navigator.pop(context);
                }
              });
        });
  }
}

class Todo {
  String todo;
  String status;
  DateTime dateTime;

  Todo({required this.todo, this.status = "pending", required this.dateTime});
}
