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
    // Normal / Alive / On-pause
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification!.title!);
      print(message.notification!.body!);
      print(message.data);
    });
    // Open / Resume
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print(message.notification!.title!);
      print(message.notification!.body!);
      print(message.data);
    });
    // Dead / On-Terminated
    FirebaseMessaging.onBackgroundMessage(handleBackgroundNotification);
  }

  Future<void> getFCMToken() async {
    final token = await firebaseMessaging.getToken();
    print(token);
  }

  Future<void> onRefresh(Function(String) onTokenRefresh) async {
    firebaseMessaging.onTokenRefresh.listen((token) {
      onTokenRefresh(token);
    });
  }

  Future<void> subscribeToTopic(String topic) async {
    await firebaseMessaging.subscribeToTopic(topic);
  }

  Future<void> unSubscribeToTopic(String topic) async {
    await firebaseMessaging.unsubscribeFromTopic(topic);
  }
}

Future<void> handleBackgroundNotification(RemoteMessage message) async {}
