import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ostad_practice/services/firebase_messaging.dart';
import 'screen/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessagingServices().initialize();
  await FirebaseMessagingServices().getFCMToken();
  await FirebaseMessagingServices().subscribeToTopic("demo");
  await FirebaseMessagingServices().onRefresh((token) {
    // TODO - Send to backend
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomePage(),
    );
  }
}
