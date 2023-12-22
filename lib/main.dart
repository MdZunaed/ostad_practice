import 'package:flutter/material.dart';
import 'package:ostad_practice/screen/google_maps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.indigo),
      home: const GoogleMapScreen(),
    );
  }
}
