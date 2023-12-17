import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingServices {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<void> requestPermission() async {
    await firebaseMessaging.requestPermission(
      sound: true,
      alert: true,
      badge: true,
      announcement: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
    );
  }

  Future<void> initialize() async {
    await requestPermission();
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification!.title!);
      print(message.notification!.body!);
      print(message.data);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print(message.notification!.title!);
      print(message.notification!.body!);
      print(message.data);
    });
    // FirebaseMessaging.onBackgroundMessage(BackgroundMessageHandler);
  }
}
