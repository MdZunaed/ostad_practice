import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController controller = TextEditingController();
int totalConsume = 0;
List<WaterTracks> consumeList = [];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Water Tracker")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text("Total Consume", style: TextStyle(fontSize: 18)),
            Text(totalConsume.toString(),
                style:
                const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  width: 100,
                  child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.number)),
              ElevatedButton(
                  onPressed: () {
                    int count = int.tryParse(controller.text.trim()) ?? 1;
                    WaterTracks wt = WaterTracks(DateTime.now(), count);
                    consumeList.add(wt);
                    totalConsume += count;
                    setState(() {});
                  },
                  child: const Text("add"))
            ]),
            const SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
                    itemCount: consumeList.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                            leading: CircleAvatar(child: Text("${index + 1}")),
                            trailing: Text(
                                consumeList[index].noOfGlass.toString()),
                            title: Text(DateFormat('hh:mm:s a d-MMM-yy')
                                .format(consumeList[index].time)),
                            onLongPress: () {
                              totalConsume -= consumeList[index].noOfGlass;
                              consumeList.removeAt(index);
                              setState(() {});
                            },
                          ));
                    }))
          ],
        ),
      ),
    );
  }
}

class WaterTracks {
  final DateTime time;
  final int noOfGlass;

  WaterTracks(this.time, this.noOfGlass);
}
