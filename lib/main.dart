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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xffF9F9F9)),
      home: const CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String image =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbTDnV3Enw_7SC2F3UEIYDoehJCuIQdt4mSg&usqp=CAU";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("My Bag",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SizedBox(
                child: Card(
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              clipBehavior: Clip.antiAlias,
              child: Row(
                children: [
                  Expanded(
                      flex: 1, child: Image.network(image, fit: BoxFit.fill)),
                  Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("asdff",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Icon(Icons.more_vert)
                                ]),
                            Row(children: [
                              Text("Color: ",
                                  style: TextStyle(color: Colors.grey)),
                              Text("Black"),
                              SizedBox(width: 10),
                              Text("Size: ",
                                  style: TextStyle(color: Colors.grey)),
                              Text("L"),
                            ]),
                            SizedBox(height: 10),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    InkWell(
                                      child: Material(
                                          elevation: 4,
                                          shape: const CircleBorder(),
                                          child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Icon(Icons.remove,
                                                  color: Colors.black))),
                                      onTap: () {},
                                    ),
                                    SizedBox(width: 10),
                                    Text("1",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 10),
                                    InkWell(
                                      child: Material(
                                          elevation: 4,
                                          shape: const CircleBorder(),
                                          child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Icon(Icons.add,
                                                  color: Colors.black))),
                                      onTap: () {},
                                    ),
                                  ]),
                                  Text("30\$",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))
                                ]),
                          ],
                        ),
                      )),
                ],
              ),
            )),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Total amount:"), Text("124\$")],
            )
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
