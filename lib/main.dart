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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String image = "https://via.placeholder.com/150";
    return Scaffold(
      appBar: AppBar(title: const Text("News Feed")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return (orientation == Orientation.portrait)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: 15,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Image.network(image,
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.scaleDown),
                                );
                              }),
                        )
                      ])
                : Row(children: [
                    Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Image.network(
                                image,
                                height: 150,
                                width: 150,
                                fit: BoxFit.scaleDown,
                              ),
                            );
                          }),
                    ),
                  ]);
          },
        ),
      ),
    );
  }
}
