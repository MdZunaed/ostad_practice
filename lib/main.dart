import 'package:flutter/material.dart';

import 'selection_page.dart';

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
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue),
          primaryColor: Colors.lightBlue),
      home: const SelectionPage(),
    );
  }
}
