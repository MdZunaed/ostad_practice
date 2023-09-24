import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}
int count = 0;

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Counter App")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Count:",style: TextStyle(fontSize: 20)),
          Text(count.toString(),style:const TextStyle(fontSize: 50)),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                count++;
                if(count >4){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      content: Text("Button pressed $count times"),
                      actions: [TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child:const Text("Close"))],
                    );
                  });
                }
                setState(() {});
              }, child:const Icon(Icons.add)),
              const SizedBox(width: 20),
              ElevatedButton(onPressed: (){
                if(count > 0){
                  count--;
                }
                setState(() {});
              }, child:const Icon(Icons.remove)),
            ],
          ),
        ],
      ),
    );
  }
}
